SET client_encoding = 'UTF8';
DROP TABLE IF EXISTS chapter CASCADE;
DROP TABLE IF EXISTS section CASCADE;
DROP TABLE IF EXISTS element_type CASCADE;
DROP TABLE IF EXISTS element;

CREATE TABLE chapter (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL
);

CREATE TABLE section (
  id SERIAL PRIMARY KEY,
  chapter_id INT NOT NULL, 
  title TEXT NOT NULL,
  number INT NOT NULL,
  FOREIGN KEY (chapter_id) REFERENCES chapter(id)
);

CREATE TABLE element_type (
  id SERIAL PRIMARY KEY,
  description TEXT NOT NULL
);

CREATE TABLE element (
  id SERIAL PRIMARY KEY,
  section_id INT NOT NULL,
  element_type_id INT NOT NULL,
  index INT NOT NULL,
  content TEXT NOT NULL,
  FOREIGN KEY (section_id) REFERENCES section(id),
  FOREIGN KEY (element_type_id) REFERENCES element_type(id)
);

INSERT INTO element_type (description)
  VALUES ('paragraph'),
         ('letter'),
         ('footnote'),
         ('no_indent'),
         ('diagram'),
         ('code'), 
         ('non_section_header'),
         ('image'),
         ('list');

INSERT INTO chapter (title) VALUES
(' Introduction'),
(' Getting Started'),
(' Step-by-Step Installation'),
(' Logging In'),
(' The Basics'),
(' Using the Shell'),
(' More on Files'),
(' Working with Text Files'),
(' The X Window System'),
(' Filesystems'),
(' Networking'),
(' Removing and Installing Software'),
(' Advanced Topics');

INSERT INTO section (chapter_id, title, number) VALUES('1', ' Introduction', '0'),
('1', ' What Is Debian?', '1'),
('1', ' A Multiuser, Multitasking Operating System', '2'),
('1', ' What Is Free Software?', '3'),
('1', ' About This Book', '4'),
('2', ' Getting Started', '0'),
('2', ' Supported Hardware', '1'),
('2', ' Before You Start', '2'),
('2', ' Partitioning Your Hard Drive', '3'),
('2', ' Choosing Your Installation Media', '4'),
('2', ' Booting the Installation System', '5'),
('3', ' Step-by-Step Installation', '0'),
('3', ' Select Color or Monochrome Display', '1'),
('3', ' Debian GNU/Linux Installation Main Menu', '2'),
('3', ' Configure the Keyboard', '3'),
('3', ' Last Chance to Back Up!', '4'),
('3', ' Partition a Hard Disk', '5'),
('3', ' Initialize and Activate a Swap Partition', '6'),
('3', ' Initialize a Linux Partition', '7'),
('3', ' Install Operating System Kernel and Modules', '8'),
('3', ' Configure PCMCIA Support', '9'),
('3', ' Configure Device Driver Modules', '10'),
('3', ' Configure the Network', '11'),
('3', ' Install the Base System', '12'),
('3', ' Make a Boot Floppy', '13'),
('3', ' The Moment of Truth', '14'),
('3', ' Set the Root Password', '15'),
('3', ' Create an Ordinary User', '16'),
('3', ' Shadow Password Support', '17'),
('3', ' Remove PCMCIA', '18'),
('3', ' Select and Install Profiles', '19'),
('3', ' Package Installation with dselect', '20'),
('3', ' Glossary', '21'),
('4', ' Logging In', '0'),
('4', ' First Steps', '1'),
('4', ' Command History and Editing the Command Line', '2'),
('4', ' Working as Root', '3'),
('4', ' Virtual Consoles', '4'),
('4', ' Shutting Down', '5'),
('5', ' The Basics', '0'),
('5', ' The Command Line and Man Pages', '1'),
('5', ' Files and Directories', '2'),
('5', ' Processes', '3'),
('5', ' The Shell', '4'),
('5', ' Managing Processes with bash', '5'),
('5', ' A Few bash Features', '6'),
('5', ' Managing Your Identity', '7'),
('6', ' Using the Shell', '0'),
('6', ' Environment Variables', '1'),
('6', ' Where Commands Reside: The PATH Variable', '2'),
('6', ' Configuration Files', '3'),
('6', ' Aliases', '4'),
('6', ' Controlling Input and Output', '5'),
('6', ' Filename Expansion', '6'),
('7', ' More on Files', '0'),
('7', 'Permissions', '1'),
('7', ' Files Present and Their Locations', '2'),
('7', ' File Compression with gzip', '3'),
('7', ' Finding Files', '4'),
('7', ' Determining a File’s Contents', '5'),
('7', ' Using a File Manager', '6'),
('8', ' Working with Text Files', '0'),
('8', ' Viewing Text Files', '1'),
('8', ' Text Editors', '2'),
('8', ' Using ae', '3'),
('9', ' The X Window System', '0'),
('9', ' Introduction to X', '1'),
('9', ' Starting the X Environment', '2'),
('9', ' Basic X Operations', '3'),
('9', ' Customizing Your X Startup', '4'),
('10', ' Filesystems', '0'),
('10', ' Concepts', '1'),
('10', ' mount and /etc/fstab', '2'),
('10', ' Backup Tools', '3'),
('11', ' Networking', '0'),
('11', ' PPP', '1'),
('11', ' Ethernet', '2'),
('12', ' Removing and Installing Software', '0'),
('12', ' What a Package Maintenance Utility Does', '1'),
('12', ' dpkg', '2'),
('12', ' dselect', '3'),
('12', ' Compiling Software', '4'),
('13', ' Advanced Topics', '0'),
('13', ' Regular Expressions', '1'),
('13', ' Advanced Files', '2'),
('13', ' Security', '3'),
('13', ' Software Development with Debian', '4');

INSERT INTO element (section_id, element_type_id, index, content) VALUES('1', '1', '0', '
'),
('1', '1', '1', '
   We’re glad to have this opportunity to introduce you to Debian! As we
   begin our journey down the road of GNU/Linux, we’d like to first talk
   a bit about what exactly Debian is—what it does, and how it fits in
   with the vast world of Free Software. Then, we talk a bit about the
   phenomenon that is Free Software and what it means for Debian and you.
   Finally, we close the chapter with a bit of information about this book
   itself.
'),
('2', '1', '0', '
'),
('2', '1', '1', '
Debian is a free operating system (OS) for your computer. An
   operating system is the set of basic programs and utilities that make your
   computer run. At the core of an operating system is the kernel. The
   kernel is the most fundamental program on the computer: It does all the
   basic housekeeping and lets you start other programs. Debian uses the
   Linux kernel, a completely free piece of software started by Linus
   Torvalds and supported by thousands of programmers worldwide. A large part
   of the basic tools that fill out the operating system come from the GNU
   Project[1], and
   these tools are also free.
'),
('2', '1', '2', '
'),
('2', '3', '3', '
 [1]
http://www.gnu.org/
'),
('2', '1', '4', '
'),
('2', '1', '5', '
   Another facet of an operating system is application software: programs
   that help get work done, from editing documents to running a business to
   playing games to writing more software. Debian comes with more than 1,500
   packages (precompiled software bundled up in a nice format for easy
   installation on your machine)—all for free.
'),
('2', '1', '6', '
'),
('2', '1', '7', '
   The Debian system is a bit like a pyramid. At the base is Linux. On top of
   that are all the basic tools, mostly from GNU. Next is all the application
   software that you run on the computer; many of these are also from GNU.
   The Debian developers act as architects and coordinators—carefully
   organizing the system and fitting everything together into an integrated,
   stable operating system: Debian GNU/Linux.
'),
('2', '1', '8', '
'),
('2', '1', '9', '
   The design philosophy of GNU/Linux is to distribute its functionality into
   small, multipurpose parts. That way, you can easily achieve new
   functionality and new features by combining the small parts (programs) in
   new ways. Debian is like an erector set: You can build all sorts of things
   with it.
'),
('2', '1', '10', '
'),
('2', '1', '11', '
   When you’re using an operating system, you want to minimize the amount of
   work you put into getting your job done. Debian supplies many tools that
   can help, but only if you know what these tools do. Spending an hour
   trying to get something to work and then finally giving up isn’t very
   productive. This guide will teach you about the core tools that make up
   Debian: what tools to use in certain situations and how to tie these
   various tools together.
'),
('2', '1', '12', '
'),
('2', '7', '13', '1.1.1 Who Creates Debian?'),
('2', '1', '14', '
'),
('2', '1', '15', '
   Debian is an all-volunteer Internet-based development project. There are
   hundreds of volunteers working on it. Most are in charge of a small number
   of software packages and are very familiar with the software they package.
'),
('2', '1', '16', '
'),
('2', '1', '17', '
   These volunteers work together by following a strict set of guidelines
   governing how packages are assembled. These guidelines are developed
   cooperatively in discussions on Internet mailing lists.
'),
('3', '1', '0', '
'),
('3', '1', '1', '
   As we mentioned earlier in section 1.1, the design of Debian GNU/Linux
   comes from the Unix operating system. Unlike common desktop operating
   systems such as DOS, Windows, and MacOS, GNU/Linux is usually found on
   large servers and multiuser systems.
'),
('3', '1', '2', '
'),
('3', '1', '3', '
   This means that Debian has features those other operating systems lack. It
   allows a large number of people to use the same computer at once, as long as
   each user has his or her own terminal.[2]
   To permit many users to work at once, Debian must allow many programs and
   applications to run simultaneously. This feature is called
   multitasking.
'),
('3', '1', '4', '
'),
('3', '3', '5', '
 [2]
A terminal is just a keyboard and a screen that are connected to the computer
through the network, over a modem, or directly. You keyboard and monitor form a
terminal that is directly attached to the computer: This special terminal is
often called the console.
'),
('3', '1', '6', '
'),
('3', '1', '7', '
   Much of the power (and complexity) of GNU/Linux systems stems from these
   two features. For example, the system must have a way to keep users from
   accidentally deleting each other’s files. The operating system also must
   coordinate the many programs running at once to ensure that they don’t all
   use the same resource, such as a hard drive, at the same time.
'),
('3', '1', '8', '
'),
('3', '1', '9', '
   If you keep in mind what Debian was originally designed to do, many
   aspects of it will make a lot more sense. You’ll learn to take advantage
   of the power of these features.
'),
('4', '1', '0', '
'),
('4', '1', '1', '
   When Debian developers and users speak of “Free Software,” they
   refer to freedom rather than price. Debian is free in this sense: You
   are free to modify and redistribute it and will always have access to the
   source code for this purpose. The Debian Free Software Guidelines[3]
   describe in more detail exactly what is meant by “free.” The
   Free Software Foundation[4],
   originator of the GNU Project, is another excellent source of information.
   You can find a more detailed discussion of free software on the Debian web
   site[5].
   One of the most well-known works in this field is Richard M.
   Stallman’s essay, Why Software Should Be Free[6];
   take a look at it for some insight into why we support Free Software as we
   do. Recently, some people have started calling Free Software “Open
   Source Software”; the two terms are interchangable.
'),
('4', '1', '2', '
'),
('4', '3', '3', '
 [3]
http://www.debian.org/social_contract#guidelines
'),
('4', '1', '4', '
'),
('4', '3', '5', '
 [4]
http://www.fsf.org/
'),
('4', '1', '6', '
'),
('4', '3', '7', '
 [5]
http://www.debian.org/
'),
('4', '1', '8', '
'),
('4', '3', '9', '
 [6]
http://www.fsf.org/philosophy/shouldbefree.html
'),
('4', '1', '10', '
'),
('4', '1', '11', '
   You may wonder why would people spend hours of their own time writing
   software and carefully packaging it, only to give it all away. The answers
   are as varied as the people who contribute.
'),
('4', '1', '12', '
'),
('4', '1', '13', '
   Many believe in sharing information and having the freedom to cooperate with
   one another, and they feel that free software encourages this. A long
   tradition that upholds these values, sometimes called the Hacker[7]
   Ethic, started in the 1950s. The Debian GNU/Linux Project was founded based
   on these Free Software ethics of freedom, sharing, and cooperation.
'),
('4', '1', '14', '
'),
('4', '3', '15', '
 [7]
Note that the term “hacker” should not be confused with the term
“cracker.” In short, a hacker is benevolent, whereas a cracker is
generally considered malevolent. Movies and other forms of media many times
incorrectly use the term “hacker” instead of “cracker.”
'),
('4', '1', '16', '
'),
('4', '1', '17', '
   Others want to learn more about computers. More and more people are
   looking for ways to avoid the inflated price of proprietary software. A
   growing community contributes in appreciation for all the great free
   software they’ve received from others.
'),
('4', '1', '18', '
'),
('4', '1', '19', '
   Many in academia create free software to help get the results of their
   research into wider use. Businesses help maintain free software so they can
   have a say in how it develops—there’s no quicker way to get a
   new feature than to implement it yourself or hire a consultant to do so!
   Business is also interested in greater reliability and the ability to choose
   between support vendors.
'),
('4', '1', '20', '
'),
('4', '1', '21', '
   Still others see free software as a social good, democratizing access to
   information and preventing excessive centralization of the world’s
   information infrastructure. Of course, a lot of us just find it great fun.
'),
('4', '1', '22', '
'),
('4', '1', '23', '
   Debian is so committed to free software that we thought it would be useful
   if it was formalized in a document of some sort. Our Social Contract[8]
   promises that Debian will always be 100% free software. When you install a
   package from the Debian main distribution, you can be sure it meets our
   Free Software Guidelines.
'),
('4', '1', '24', '
'),
('4', '3', '25', '
 [8]
http://www.debian.org/social_contract
'),
('4', '1', '26', '
'),
('4', '1', '27', '
   Although Debian believes in free software, there are cases where people
   want to put proprietary software on their machine. Whenever possible
   Debian will support this; though proprietary software is not included in
   the main distribution, it is sometimes available on the FTP site in the
   non-free directory, and there is a growing number of packages whose sole
   job is to install proprietary software we are not allowed to distribute
   ourselves.
'),
('4', '1', '28', '
'),
('4', '1', '29', '
   It is important to distinguish commercial software from
   proprietary software. Proprietary software is non-free software;
   commercial software is software sold for money. Debian permits commercial
   software, but not proprietary software, to be a part of the main
   distribution. Remember that the phrase “free software” does not
   refer to price; it is quite possible to sell free software. For more
   clarification of the terminology, see http://www.opensource.org/or
   http://www.fsf.org/philosophy/categories.html.
'),
('5', '1', '0', '
'),
('5', '1', '1', '
   This book is aimed at readers who are new to Debian GNU/Linux. It assumes
   no prior knowledge of GNU/Linux or other Unix-like systems, but it does
   assume very basic general knowledge about computers and hardware; you
   should know what the basic parts of a computer are, and what one might use
   a computer to do.
'),
('5', '1', '2', '
'),
('5', '1', '3', '
   In general, this tutorial tries to help you understand what happens inside
   a Debian system. The idea is to empower you to solve new problems and get
   the most out of your computer. Thus there’s plenty of theory and fun facts
   thrown in with the “How To” aspects of the manual.
'),
('5', '1', '4', '
'),
('5', '1', '5', '
   We’d love to hear your comments about this book! You can reach the authors
   at debian-guide@complete.org. We’re especially interested in whether it
   was helpful to you and how we could make it better. Whether you have a
   comment or think this book is the greatest thing since sliced bread,
   please send us e-mail.
'),
('5', '1', '6', '
'),
('5', '1', '7', '
   Please do not send the authors technical questions about Debian, because
   there are other forums for that; see Appendix A on page [*] for more
   information on the documentation and getting help. Only send mail
   regarding the book itself to the above address.
'),
('5', '1', '8', '
'),
('5', '7', '9', '1.4.1 How to Read This Book'),
('5', '1', '10', '
'),
('5', '1', '11', '
   The best way to learn about almost any computer program is by using it.
   Most people find that reading a book without using the program isn’t
   beneficial. The best way to learn about Unix and GNU/Linux is by using
   them. Use GNU/Linux for everything you can. Feel free to experiment!
'),
('5', '1', '12', '
'),
('5', '1', '13', '
   Debian isn’t as intuitively obvious as some other operating systems. You
   will probably end up reading at least the first few chapters of this book.
   GNU/Linux’s power and complexity make it difficult to approach at first,
   but far more rewarding in the long run.
'),
('5', '1', '14', '
'),
('5', '1', '15', '
   The suggested way to learn is to read a little, and then play a little.
   Keep playing until you’re comfortable with the concepts, and then start
   skipping around in the book. You’ll find a variety of topics are covered,
   some of which you might find interesting. After a while, you should feel
   confident enough to start using commands without knowing exactly what they
   do. This is a good thing.
'),
('5', '1', '16', '
'),
('5', '2', '17', '
     Tip: If you ever mistakenly type a command or don’t know how to exit a
     program, press CTRL-c (the Ctrl key and the lowercase letter c pressed
     simultaneously). This will often stop the program.
'),
('5', '1', '18', '
'),
('5', '7', '19', '1.4.2 Conventions'),
('5', '1', '20', '
'),
('5', '1', '21', '
   Before going on, it’s important to be familiar with the typographical
   conventions used in this book.
'),
('5', '1', '22', '
'),
('5', '1', '23', '
   When you should simultaneously hold down multiple keys, a notation like
   CTRL-a will be used. This means “press the Ctrl key and press lowercase
   letter a.” Some keyboards have both Alt and Meta; most home computers
   have only Alt, but the Alt key behaves like a Meta key. So if you have no
   Meta key, try the Alt key instead.
'),
('5', '1', '24', '
'),
('5', '1', '25', '
   Keys like Alt and Meta are called modifier keys because they change
   the meaning of standard keys like the letter A. Sometimes you need to hold
   down more than one modifier; for example, Meta-Ctrl-a means to
   simultaneously press Meta, Ctrl, and lowercase a.
'),
('5', '1', '26', '
'),
('5', '1', '27', '
   Some keys have a special notation—for example, Ret (Return/Enter), Del
   (Delete or sometimes Backspace), Esc (Escape). These should be fairly
   self-explanatory.
'),
('5', '1', '28', '
'),
('5', '1', '29', '
   Spaces used instead of hyphens mean to press the keys in sequential order.
   For example, CTRL-a x RET means to simultaneously type Ctrl and lowercase
   a, followed by the letter x, followed by pressing Return. (On some
   keyboards, this key is labeled Enter. Same key, different name.)
'),
('5', '1', '30', '
'),
('5', '1', '31', '
   In sample sessions, bold face text denotes characters typed by the user,
   italicized text denotes comments about a given part of the sample session,
   and all other text is output from entering a command. For shorter
   commands, you’ll sometimes find that the command can be found within other
   text, highlighed with a monospace font.
'),
('6', '1', '0', '
'),
('6', '2', '1', '
     “A journey of a thousand miles must begin with a single step.”
     —Lao-Tsu
'),
('6', '1', '2', '
'),
('6', '1', '3', '
   Now that you’ve read about the ideas and philosophy behind Linux and
   Debian, it’s time to start putting it on your computer! We start by
   talking about how to prepare for a Debian install, then about partitioning
   your disk, and finally, how to start up the installation system.
'),
('7', '1', '0', '
'),
('7', '1', '1', '
   Debian does not impose hardware requirements beyond the requirements of
   the Linux kernel and the GNU tools.
'),
('7', '1', '2', '
'),
('7', '1', '3', '
   Rather than attempting to describe all the different hardware
   configurations that are supported for the PC platform, this section
   contains general information and pointers to where additional information
   can be found.
'),
('7', '1', '4', '
'),
('7', '1', '5', '
   There are two excellent places to check for detailed information: the Debian
   System Requirements[1]
   list and the Linux Documentation Project Hardware Compatibility HOWTO[2].
   For information on video card support, you may also want to look at the
   XFree86[3]
   Project web site.
'),
('7', '1', '6', '
'),
('7', '3', '7', '
 [1]
http://www.debian.org/releases/slink/i386/ch-hardware-req.en.html
'),
('7', '1', '8', '
'),
('7', '3', '9', '
 [2]
http://metalab.unc.edu/LDP/HOWTO/Hardware-HOWTO.html
'),
('7', '1', '10', '
'),
('7', '3', '11', '
 [3]
http://www.xfree86.org/
'),
('7', '1', '12', '
'),
('7', '7', '13', '2.1.1 Memory and Disk Space Requirements'),
('7', '1', '14', '
'),
('7', '1', '15', '
   You must have at least 4MB of memory and 35MB of available hard disk space.
   If you want to install a reasonable amount of software, including the X
   Window system, and some development programs and libraries, you’ll
   need at least 300MB. For an essentially full installation, you’ll need
   around 800MB. To install everything available in Debian, you’ll
   probably need around 2GB. Actually, installing everything doesn’t make
   sense because some packages provide the same services.
'),
('8', '1', '0', '
'),
('8', '1', '1', '
   Before you start, make sure to back up every file that is now on your
   system. The installation procedure can wipe out all of the data on a hard
   disk! The programs used in installation are quite reliable and most have
   seen years of use; still, a false move can cost you. Even after backing
   up, be careful and think about your answers and actions. Two minutes of
   thinking can save hours of unnecessary work.
'),
('8', '1', '2', '
'),
('8', '1', '3', '
   Debian makes it possible to have both Debian GNU/Linux and another
   operating system installed on the same system. If you plan to use this
   option, make sure that you have on hand the original CD-ROM or floppies of
   the other installed operating systems. If you repartition your boot drive,
   you may find that you have to reinstall your existing operating system’s
   boot loader[4]
   or the entire operating system itself.
'),
('8', '1', '4', '
'),
('8', '3', '5', '
 [4]
A boot loader is responsible starting an operating system’s boot
procedure.
'),
('8', '1', '6', '
'),
('8', '7', '7', '2.2.1 Information You Will Need'),
('8', '1', '8', '
'),
('8', '1', '9', '
   If your computer is connected to a network 24 hours a day (i.e., an Ethernet
   or similar LAN connection—not a PPP connection), you should ask your
   network’s system administrator for the following information:
'),
('8', '1', '10', '
'),
('8', '9', '11', '
     ◼ Your host name (you may be able to decide this on your own)

     ◼ Your domain name

     ◼ Your computer’s IP address

     ◼ The IP address of your network

     ◼ The netmask to use with your network

     ◼ The broadcast address to use on your network

     ◼ The IP address of the default gateway system you should route to, if
       your network has a gateway

     ◼ The system on your network that you should use as a DNS server

     ◼ Whether you connect to the network using Ethernet

     ◼ Whether your Ethernet interface is a PCMCIA card, and if so, the type
       of PCMCIA controller you have

   If your only network connection is a telephone line using PPP or an
   equivalent dialup connection, you don’t need to worry about getting your
   network set up until your system is already installed. See section 11.1 on
   page 99 for information on setting up PPP under Debian.
'),
('9', '1', '0', '
'),
('9', '1', '1', '
   Before you install Debian on your computer, it is generally a good idea to
   plan how the contents of your hard drive will be arranged. One part of
   this process involves partitioning your hard drive.
'),
('9', '1', '2', '
'),
('9', '7', '3', '
2.3.1 Background
'),
('9', '1', '4', '
'),
('9', '1', '5', '
   Partitioning your disk simply refers to the act of breaking up your disk
   into sections. Each section is then independent of the others. It’s
   roughly equivalent to putting up walls in a house; after that, adding
   furniture to one room doesn’t affect any other room.
'),
('9', '1', '6', '
'),
('9', '1', '7', '
   If you already have an operating system on your system (Windows 95,
   Windows NT, DOS, etc.) and you want to install Debian GNU/Linux on the
   same disk, you will probably need to repartition the disk. In general,
   changing a partition that already has a filesystem on it will destroy any
   information in that filesystem. Therefore, you should always make backups
   before doing any repartitioning. Using the analogy of the house, you would
   probably want to move all the furniture out of the way before moving a
   wall or you risk destroying your furniture. Luckily, there is an
   alternative for some users; see section 2.3.6 on page [*] for more
   information.
'),
('9', '1', '8', '
'),
('9', '1', '9', '
   At a bare minimum, GNU/Linux needs one partition for itself. You can have
   a single partition containing the entire operating system, applications,
   and your personal files. Most people choose to give GNU/Linux more than
   the minimum number of partitions, however. There are two reasons you might
   want to break up the filesystem into a number of smaller partitions. The
   first is for safety. If something happens to corrupt the filesystem,
   generally only one partition is affected. Thus, you only have to replace
   (from the backups you’ve been carefully keeping) a portion of your system.
   At the very least, you should consider creating what is commonly called a
   “root partition.” This contains the most essential components of the
   system. If any other partitions get corrupted, you can still boot into
   GNU/Linux to fix the system. This can save you the trouble of having to
   reinstall the system from scratch.
'),
('9', '1', '10', '
'),
('9', '1', '11', '
   The second reason is generally more important in a business setting, but
   it really depends on your use of the machine. Suppose something runs out
   of control and starts eating disk space. If the process causing the
   problem happens to have root privileges (the system keeps a percentage of
   the disk away from users), you could suddenly find yourself out of disk
   space. This is not good since the operating system needs to use real files
   (besides swap space) for many things. It may not even be a problem of
   local origin. For example, unsolicited e-mail (“spam”) can easily fill a
   partition. By using more partitions, you protect the system from many of
   these problems. Using e-mail as an example again, by putting the directory
   /var/spool/mail on its own partition, the bulk of the system will work
   even if unsolicited e-mail fills that partition.
'),
('9', '1', '12', '
'),
('9', '1', '13', '
   Another reason applies only if you have a large IDE disk drive and are using
   neither LBA addressing nor overlay drivers[5].
   In this case, you will have to put the root partition into the first 1,024
   cylinders of your hard drive, usually around 524 megabytes. See section
   2.3.3 on page [*] for more information on this issue.
'),
('9', '1', '14', '
'),
('9', '3', '15', '
 [5]
See your hard drive manual for a description of these features.
'),
('9', '1', '16', '
'),
('9', '1', '17', '
   Most people feel that a swap partition is also a necessity, although this
   isn’t strictly true. “Swap” is scratch space for an operating system,
   which allows the system to use disk storage as “virtual memory” in
   addition to physical memory. Putting swap on a separate partition allows
   Linux to make much more efficient use of it. It is possible to force Linux
   to use a regular file as swap, but this is not recommended.
'),
('9', '1', '18', '
'),
('9', '1', '19', '
   The only real drawback to using more partitions is that it is often
   difficult to know in advance what your needs will be. If you make a
   partition too small, either you will have to reinstall the system, or you
   will be constantly moving things around to make room in the undersized
   partition. On the other hand, if you make the partition too big, you may
   be wasting space that could be used elsewhere.
'),
('9', '1', '20', '
'),
('9', '7', '21', '
2.3.2 Planning Use of the System
'),
('9', '1', '22', '
'),
('9', '1', '23', '
   Disk space requirements and your partitioning scheme are influenced by the
   type of installation you decide to create.
'),
('9', '1', '24', '
'),
('9', '1', '25', '
   For your convenience, Debian offers a number of default “profiles” some
   of which are listed later in this section. Profiles are simply preselected
   sets of packages designed to provide certain desired capabilities on your
   system. Installation is easier since packages that fit your desired
   profile are automatically marked for installation. Each given profile
   lists the size of the resulting system after installation is complete.
   Even if you don’t use these profiles, this discussion is important for
   planning, since it will give you a sense of how large your partition or
   partitions need to be. The following are some of the available profiles
   and their sizes:
'),
('9', '1', '26', '
'),
('9', '1', '27', '
Server_std.
           This is a small server profile, useful for a stripped-down server,
           that does not have a lot of niceties for shell users. It basically
           has an FTP server, a web server, DNS, NIS, and POP. It will take
           up around 50MB. Of course, this is just the size of the software;
           any data you serve would be additional.
'),
('9', '1', '28', '
'),
('9', '1', '29', '
Dialup.
           This profile would be good for a standard desktop box, including
           the X Window system, graphics applications, sound, editors, etc.
           The size of the packages will be around 500MB.
'),
('9', '1', '30', '
'),
('9', '1', '31', '
Work_std.
           This profile is suitable for a stripped-down user machine without
           the X Window system or X applications. It is also suitable for a
           laptop or mobile computer. The size is around 140MB. It is
           possible to have a simple laptop setup including X with less than
           100MB.
'),
('9', '1', '32', '
'),
('9', '1', '33', '
Devel_comp.
           This is a desktop setup profile with all the popular development
           packages, such as Perl, C, and C++. It requires around 475MB.
           Assuming you are adding X and some additional packages for other
           uses, you should plan for approximately 800MB of disk space for
           this type of installation.
'),
('9', '1', '34', '
'),
('9', '1', '35', '
   Remember that these sizes don’t include all the other materials that are
   normally found, such as user files, mail, and data. It is always best to
   be generous when considering the space for your own files and data.
   Notably, the Debian /var directory contains a lot of state information.
   The installed package management files can easily consume 20MB of disk
   space. In general, you should allocate at least 50MB for the /var
   directory because system log files are also stored there.
'),
('9', '1', '36', '
'),
('9', '7', '37', '
2.3.3 PC Disk Limitations
'),
('9', '1', '38', '
'),
('9', '1', '39', '
   A PC BIOS generally adds additional constraints for disk partitioning. There
   is a limit to how many “primary” and “logical”
   partitions a drive can contain. Additionally, there are limits to where on
   the drive the BIOS looks for boot information. More information can be found
   in the Linux Partition mini-HOWTO[6].
   This section will include a brief overview to help you plan most situations.
'),
('9', '1', '40', '
'),
('9', '3', '41', '
 [6]
http://metalab.unc.edu/LDP/HOWTO/mini/Partition.html
'),
('9', '1', '42', '
'),
('9', '1', '43', '
   “Primary” partitions are the original partitioning scheme for PC hard
   disks. However, there can be only four of them. To get past this
   limitation, “extended” or “logical” partitions were invented. By
   setting one of your primary partitions as an extended partition, you can
   subdivide all the space allocated to that partition into logical
   partitions. The number of logical partitions you can create is much less
   limited than the number of primary partitions you can create; however, you
   can have only one extended partition per drive.
'),
('9', '1', '44', '
'),
('9', '1', '45', '
   Linux limits the number of partitions per drive to 15 partitions for SCSI
   drives (3 usable primary partitions, 12 logical partitions), and 63
   partitions for IDE drives (3 usable primary partitions, 60 logical
   partitions).
'),
('9', '1', '46', '
'),
('9', '1', '47', '
   The last issue you need to know about a PC BIOS is that your boot
   partition—that is, the partition containing your kernel
   image—needs to be contained within the first 1,024 cylinders of the
   drive. Because the root partition is usually your boot partition, you need
   to make sure your root partition fits into the first 1,024 cylinders.
'),
('9', '1', '48', '
'),
('9', '1', '49', '
   If you have a large disk, you may have to use cylinder translation
   techniques, which you can set in your BIOS, such as LBA translation mode.
   (More information about large disks can be found in the Large Disk
   mini-HOWTO[7].)
   If you are using a cylinder translation scheme, your boot partition must fit
   within the translated representation of cylinder 1,024.
'),
('9', '1', '50', '
'),
('9', '3', '51', '
 [7]
http://metalab.unc.edu/LDP/HOWTO/mini/Large-Disk.html
'),
('9', '1', '52', '
'),
('9', '7', '53', '
2.3.4 Device Names in Linux
'),
('9', '1', '54', '
'),
('9', '1', '55', '
   Linux disks and partition names may be different from those in other
   operating systems. You should know the names that Linux uses when you
   create and mount partitions. The basic scheme can be found in Table 2.1 on
   page [*].
'),
('9', '1', '56', '
'),
('9', '5', '57', '			Table 2.1: Linux Device Names
+------------------------------------------------------------------------------+
| Device                                        |          Linux Name          |
|-----------------------------------------------+------------------------------|
| First floppy drive                            |           /dev/fd0           |
|-----------------------------------------------+------------------------------|
| Second floppy drive                           |           /dev/fd1           |
|-----------------------------------------------+------------------------------|
| First partition on /dev/hda (typically C: in  |          /dev/hda1           |
| other OSs)                                    |                              |
|-----------------------------------------------+------------------------------|
| Fifth partition on /dev/hdc                   |          /dev/hdc5           |
|-----------------------------------------------+------------------------------|
| Second partition on /dev/sdb                  |          /dev/sdb2           |
|-----------------------------------------------+------------------------------|
| Entire Primary-Master IDE hard disk or CD-ROM |           /dev/hda           |
|-----------------------------------------------+------------------------------|
| Entire Primary-Slave IDE hard disk or CD-ROM  |           /dev/hdb           |
|-----------------------------------------------+------------------------------|
| Entire Secondary-Master IDE hard disk or      |           /dev/hdc           |
| CD-ROM                                        |                              |
|-----------------------------------------------+------------------------------|
| Entire Secondary-Slave IDE hard disk or       |           /dev/hdd           |
| CD-ROM                                        |                              |
|-----------------------------------------------+------------------------------|
| First SCSI disk                               |           /dev/sda           |
|-----------------------------------------------+------------------------------|
| Second and remaining SCSI disks               |    /dev/sdb and so forth     |
|-----------------------------------------------+------------------------------|
| First serial port (COM1 in other OSs)         |          /dev/ttyS0          |
|-----------------------------------------------+------------------------------|
| Second, third, etc. serial ports              | /dev/ttyS1, /dev/ttyS2, etc. |
|-----------------------------------------------+------------------------------|
| SCSI tape units (automatic rewind)            |   /dev/st0, /dev/st1, etc.   |
|-----------------------------------------------+------------------------------|
| SCSI tape units (no automatic rewind)         |  /dev/nst0, /dev/nst1, etc.  |
|-----------------------------------------------+------------------------------|
| SCSI CD-ROMs                                  |  /dev/scd0, /dev/scd1, etc.  |
+------------------------------------------------------------------------------+
'),
('9', '1', '58', '
'),
('9', '1', '59', '
   The partitions on each disk are represented by appending a number to the
   disk name. For example, the names hda1 and hda2 represent the first and
   second partitions of the first IDE disk drive in your system. Linux
   represents the primary partitions with the drive name plus the numbers 1
   through 4. For example, the first primary partition on the first IDE drive
   is /dev/hda1. The logical partitions are numbered starting at 5, so the
   first logical partition on that same drive is /dev/hda5. Remember that the
   extended partition—that is, the primary partition holding the logical
   partitions—is not usable by itself. This applies to SCSI drives as
   well as IDE drives.
'),
('9', '1', '60', '
'),
('9', '1', '61', '
   Let’s assume you have a system with two SCSI disks, one at SCSI address 2
   and the other at SCSI address 4. The first disk (at address 2) is then
   named sda and the second sdb. If the sda drive has three partitions on it,
   these will be named sda1, sda2, and sda3. The same applies to the sdb disk
   and its partitions. Note that if you have two SCSI host bus adapters
   (i.e., controllers), the order of the drives can get confusing. The best
   solution in this case is to watch the boot messages, assuming you know the
   drive models.
'),
('9', '1', '62', '
'),
('9', '7', '63', '
2.3.5 Recommended Partitioning Scheme
'),
('9', '1', '64', '
'),
('9', '1', '65', '
   As described above, you should have a separate smaller root partition and
   a larger /usr partition if you have the space. For most users, the two
   partitions initially mentioned are sufficient. This is especially
   appropriate when you have a single small disk, because creating lots of
   partitions can waste space.
'),
('9', '1', '66', '
'),
('9', '1', '67', '
   In some cases, you might need a separate /usr/local partition if you plan
   to install many programs that are not part of the Debian distribution. If
   your machine will be a mail server, you may need to make /var/spool/mail a
   separate partition. Putting /tmp on its own 20 to 32MB partition, for
   instance, is a good idea. If you are setting up a server with lots of user
   accounts, it’s generally good to have a separate, large /home partition to
   store user home directories. In general, the partitioning situation varies
   from computer to computer depending on its uses.
'),
('9', '1', '68', '
'),
('9', '1', '69', '
   For very complex systems, you should see the Multi Disk HOWTO[8].
   It contains in-depth information, mostly of interest to people setting up
   servers.
'),
('9', '1', '70', '
'),
('9', '3', '71', '
 [8]
http://metalab.unc.edu/LDP/HOWTO/Multi-Disk-HOWTO.html
'),
('9', '1', '72', '
'),
('9', '1', '73', '
   Swap partition sizes should also be considered. There are many views about
   swap partition sizes. One rule of thumb that works well is to use as much
   swap as you have system memory, although there probably isn’t much point
   in going over 64MB of swap for most users. It also shouldn’t be smaller
   than 16MB, in most cases. Of course, there are exceptions to these rules.
   If you are trying to solve 10,000 simultaneous equations on a machine with
   256MB of memory, you may need a gigabyte (or more) of swap space.
'),
('9', '1', '74', '
'),
('9', '1', '75', '
   As an example, consider a machine that has 32MB of RAM and a 1.7GB IDE
   drive on /dev/hda. There is a 500MB partition for another operating system
   on /dev/hda1. A 32MB swap partition is used on /dev/hda3 and the rest,
   about 1.2GB, on /dev/hda2 is the Linux partition.
'),
('9', '1', '76', '
'),
('9', '7', '77', '
2.3.6 Partitioning Prior to Installation
'),
('9', '1', '78', '
'),
('9', '1', '79', '
   There are two different times that you can partition: prior to or during
   the installation of Debian. If your computer will be solely dedicated to
   Debian you should partition during installation as described in section
   3.5 on page [*]. If you have a machine with more than one operating system
   on it, you should generally let the other operating system create its own
   partitions.
'),
('9', '1', '80', '
'),
('9', '1', '81', '
   The following sections contain information regarding partitioning in your
   native operating system prior to Debian installation. Note that you’ll
   have to map between how the other operating system names partitions and
   how Linux names partitions; see Table 2.1 on page [*].
'),
('9', '1', '82', '
'),
('9', '7', '83', '
  Partitioning from DOS or Windows
'),
('9', '1', '84', '
'),
('9', '1', '85', '
   If you are manipulating existing FAT or NTFS partitions, it is recommended
   that you use either the scheme below or native Windows or DOS tools.
   Otherwise, it is not really necessary to partition from DOS or Windows;
   the Linux partitioning tools will generally do a better job.
'),
('9', '1', '86', '
'),
('9', '7', '87', '
  Lossless Repartitioning
'),
('9', '1', '88', '
'),
('9', '1', '89', '
   One of the most common installations is onto a system that already
   contains DOS (including Windows 3.1), Win32 (such as Windows 95, 98, NT),
   or OS/2 and it is desired to put Debian onto the same disk without
   destroying the previous system. As explained in section 2.3.1 on page [*],
   decreasing the size of an existing partition will almost certainly damage
   the data on that partition unless certain precautions are taken. The
   method described here, while not guaranteed to protect your data, works
   extremely well in practice. As a precaution, you should make a
   backup.
'),
('9', '1', '90', '
'),
('9', '1', '91', '
   Before going any further, you should have decided how you will divide up
   the disk. The method in this section will only split a partition into two
   pieces. One will contain the original operating system, and the other will
   be used for Debian. During the installation of Debian, you will be given
   the opportunity to use the Debian portion of the disk as you see fit,
   i.e., as swap or as a filesystem.
'),
('9', '1', '92', '
'),
('9', '1', '93', '
   The idea is to move all the data on the partition to the beginning before
   changing the partition information, so that nothing will be lost. It is
   important that you do as little as possible between the data movement and
   repartitioning to minimize the chance of a file being written near the end
   of the partition as this will decrease the amount of space you can take
   from the partition.
'),
('9', '1', '94', '
'),
('9', '1', '95', '
   The first thing you need is a copy of FIPS, which is available in the
   tools directory on your Debian CD-ROM. This disk must be bootable. Under
   DOS, a bootable floppy can be created using the command sys a: for a
   previously formatted floppy or format a: /s for an unformatted floppy.
   Unzip the archive and copy the files RESTORRB.EXE, FIPS.EXE and ERRORS.TXT
   to the bootable floppy. FIPS comes with very good documentation that you
   may want to read. You should definitely read the documentation if you use
   a disk compression driver or a disk manager. Create the disk and read the
   documentation before you continue.
'),
('9', '1', '96', '
'),
('9', '1', '97', '
   The next thing to be done is to move all the data to the beginning of the
   partition. DEFRAG, which comes standard with DOS 6.0 and later, can easily
   do the job. See the FIPS documentation for a list of other software that
   may also work. Note that if you have Windows 95 or higher, you must run
   DEFRAG from there, because DOS doesn’t understand VFAT, which is used to
   support long filenames in Windows 95 and higher.
'),
('9', '1', '98', '
'),
('9', '1', '99', '
   After running the defragmenter (which can take a while on a large disk),
   reboot with the FIPS floppy disk you created. Simply type a:\ fips and
   follow the directions.
'),
('9', '1', '100', '
'),
('9', '1', '101', '
   Note that there are many other other partition managers out there, in case
   FIPS doesn’t work for you.
'),
('9', '1', '102', '
'),
('9', '7', '103', '
2.3.7 Debian Installation Steps
'),
('9', '1', '104', '
'),
('9', '1', '105', '
   As you initially install Debian, you will proceed through several
   different steps:
'),
('9', '1', '106', '
'),
('9', '2', '107', '
    1. Boot the installation system

    2. Initial system configuration

    3. Install the base system

    4. Boot the newly installed base system

    5. Install the rest of the system
'),
('9', '1', '108', '
'),
('9', '1', '109', '
   Booting the Debian installation system, the first step, is generally done
   with the Rescue Floppy or from the CD-ROM.
'),
('9', '1', '110', '
'),
('9', '1', '111', '
   Once you’ve booted into Linux, the dbootstrap program will launch and
   guide you through the second step, the initial system configuration. This
   step is described in detail in section 3 on page [*].
'),
('9', '1', '112', '
'),
('9', '1', '113', '
   The “Debian base system” is a core set of packages that are required to
   run Debian in a minimal, stand-alone fashion. dbootstrap will install it
   from your CD-ROM, as described in section 3.12 on page [*]. Once you have
   configured and installed the base system, your machine can “stand on its
   own.”
'),
('9', '1', '114', '
'),
('9', '1', '115', '
   The final step is the installation of the remainder of the Debian system.
   This would include the applications and documents that you actually use on
   your computer, such as the X Window system, editors, shells, and
   development environments. The rest of the Debian system can be installed
   from CD-ROM. At this point, you’ll be using the standard Debian package
   management tools, such as dselect. This step is described in section 3.20
   on page [*].
'),
('10', '1', '0', '
'),
('10', '1', '1', '
   First, choose the boot media for the installation system. Next, choose the
   method you will use to install the base system.
'),
('10', '1', '2', '
'),
('10', '1', '3', '
   To boot the installation system, you have the following choices: bootable
   CD-ROM, floppies, or a non-Linux boot loader.
'),
('10', '1', '4', '
'),
('10', '1', '5', '
   CD-ROM booting is one of the easiest ways to install. Not all machines can
   boot directly from the CD-ROM so you may still need to use floppies.
   Booting from floppies is supported for most platforms. Floppy booting is
   described in section 2.4.2 on page [*].
'),
('10', '1', '6', '
'),
('10', '7', '7', '
2.4.1 Installing from a CD-ROM
'),
('10', '1', '8', '
'),
('10', '1', '9', '
   If your system supports booting from a CD-ROM, you don’t need any
   floppies. Put the CD-ROM into the drive, turn your computer off, and then
   turn it back on. You should see a Welcome screen with a boot prompt at the
   bottom. Now you can skip down to section 2.5.
'),
('10', '1', '10', '
'),
('10', '1', '11', '
   If your computer didn’t “see” the Debian CD-ROM, the easiest option is
   to make two floppies for booting (described in section 2.4.2) and then use
   them to start Debian. Don’t worry; after Debian is finished with those two
   floppies, it will find your CD-ROM with no trouble.
'),
('10', '1', '12', '
'),
('10', '7', '13', '
2.4.2 Booting from Floppies
'),
('10', '1', '14', '
'),
('10', '1', '15', '
   It’s not hard at all to boot from floppies. In fact, your CD-ROM contains
   all the information necessary to create boot disks for you. For these
   instructions, you will need to get two disks. Label the first one “Debian
   2.1 Install/Rescue Disk” and the second “Debian 2.1 Modules/Drivers
   Disk.”
'),
('10', '1', '16', '
'),
('10', '7', '17', '
  Creating Floppies from Disk Images
'),
('10', '1', '18', '
'),
('10', '1', '19', '
   Disk images are files containing the complete contents of a floppy disk in
   raw form. Disk images, such as resc1440.bin, cannot simply be copied
   to floppy drives. A special program is used to write the image files to
   floppy disk in raw mode.
'),
('10', '1', '20', '
'),
('10', '1', '21', '
   First, you need to get to a DOS prompt. In Windows 95 and above, you can
   do this by double-clicking on an MS-DOS icon or by going to Start\(
   \rightarrow \)Programs\( \rightarrow \)MS-DOS prompt. Then, insert your
   Debian GNU/Linux CD-ROM into your CD-ROM drive. First, you change to your
   CD-ROM drive. In most cases, this is D:.
'),
('10', '1', '22', '
'),
('10', '6', '23', '
   C:\WINDOWS>D:
'),
('10', '1', '24', '
'),
('10', '4', '25', '
   Now, change to the directory containing the disk images.
'),
('10', '1', '26', '
'),
('10', '6', '27', '
   D:\>CD

   \DISTS\SLINK\MAIN\DISKS-I386\2.1.8-1999-02-22
'),
('10', '1', '28', '
'),
('10', '4', '29', '
   If you get an error, double-check what you’re typing. If the error
   persists, manually issue CD \DISTS\SLINK\MAIN\DISKS-I386, then run DIR,
   and then CD into the directory indicated. Note that the above commands,
   and some other examples below, may appear as a single line on your display
   even if they are wrapped here.
'),
('10', '1', '30', '
'),
('10', '1', '31', '
   Now, you’re ready to create the first of two disks. Start the program to
   write them out, rawrite2:
'),
('10', '1', '32', '
'),
('10', '6', '33', '
   D:\DISTS\SLINK\MAIN\DISKS-I386\

   2.1.8-1999-02-22>rawrite2

   RaWrite 2.0 - Write disk file to

   raw floppy diskette
'),
('10', '1', '34', '
'),
('10', '4', '35', '
   Rawrite2 starts and displays its welcome message. Next, it asks for the
   filename and diskette drive. You tell it to write resc1440.bin to a:
'),
('10', '1', '36', '
'),
('10', '2', '37', '
   Enter disk image source file name: resc1440.bin

   Enter target diskette drive: a:
'),
('10', '1', '38', '
'),
('10', '4', '39', '
   Rawrite2 now asks you to insert a disk into the floppy drive. Do so and
   press Enter.
'),
('10', '1', '40', '
'),
('10', '2', '41', '
   Plese insert a formatted diskette into

   drive A: and press -ENTER- :
'),
('10', '1', '42', '
'),
('10', '4', '43', '
   At this point, rawrite2 will create the first of the two disks. Now, you
   need to repeat the process for the second disk:
'),
('10', '1', '44', '
'),
('10', '6', '45', '
   D:\DISTS\SLINK\MAIN\DISKS-I386\

   2.1.8-1999-02-22>rawrite2

   RaWrite 2.0 - Write disk file to

   raw floppy diskette

   Enter disk image source file name: drv1440.bin

   Enter target diskette drive: a:

   Please insert a formatted diskette into

   drive A: and press -ENTER- :
'),
('10', '1', '46', '
'),
('10', '4', '47', '
   By now, your disks are created. You can now use the first one to boot.
'),
('10', '1', '48', '
'),
('10', '7', '49', '
  Booting Debian
'),
('10', '1', '50', '
'),
('10', '1', '51', '
   You are now ready to boot into Debian! Shut down your existing operating
   system, turn off your computer, and place the Install/Rescue Disk into the
   floppy drive. Now turn your computer back on. You should get a Welcome
   screen with a boot prompt at the bottom.
'),
('11', '1', '0', '
'),
('11', '1', '1', '
   You should now have the boot prompt. Simply press Enter at this point.
'),
('11', '1', '2', '
'),
('11', '1', '3', '
   Once you press Enter, you should see the message Loading..., and then
   Uncompressing Linux..., and then a screenful or so of information about
   the hardware in your system. In general, you can ignore these messages.
   Linux will look for various hardware devices and will tell you what it
   finds and doesn’t find. Don’t worry about messages at this point. Just
   wait until you see the Color Selection screen. If you have trouble, see
   section B.2 on page [*].
'),
('12', '1', '0', '
'),
('12', '1', '1', '
   dbootstrap is the name of the program that is run after you have booted
   into the installation system. It is responsible for initial system
   configuration and the installation of the “base system.”
'),
('12', '1', '2', '
'),
('12', '1', '3', '
   The main job of dbootstrap and the main purpose of your initial system
   configuration is to configure certain core elements of your system. For
   instance, this includes your IP address, host name, and other aspects of
   your networking setup, if any. This also includes the configuration of
   “kernel modules,” which are drivers that are loaded into the kernel.
   These modules include storage hardware drivers, network drivers, special
   language support, and support for other peripherals. Configuring these
   fundamental things is done first, because it is often necessary for the
   system to function properly for the next steps of installation.
'),
('12', '1', '4', '
'),
('12', '1', '5', '
   dbootstrap is a simple, character-based application. It is very easy to
   use; generally, it will guide you through each step of the installation
   process in a linear fashion. You can also go back and repeat steps if you
   made a mistake. Navigation within dbootstrap is accomplished with the
   arrow keys, Enter, and Tab.
'),
('13', '1', '0', '
'),
('13', '1', '1', '
   Once the system has finished booting, dbootstrap is invoked. The first
   thing that dbootstrap asks about is your display. You should see the
   “Select Color or Monochrome display” dialog box. If your monitor is
   capable of displaying color, press Enter. The display should change from
   black-and-white to color. Then press Enter again, on the “Next” item, to
   continue with the installation.
'),
('13', '1', '2', '
'),
('13', '1', '3', '
   If your monitor can display only black and white, use the arrow keys to
   move the cursor to the “Next” menu item, and then press Enter to
   continue with the installation.
'),
('14', '1', '0', '
'),
('14', '1', '1', '
   You may see a dialog box that says “The installation program is
   determining the current state of your system and the next installation
   step that should be performed.” This is a phase in which the installation
   program automatically figures out what you probably need to do next. In
   some cases, you may not even see this box.
'),
('14', '1', '2', '
'),
('14', '1', '3', '
   During the entire installation process, you will be presented with the main
   menu, titled “Debian GNU/Linux Installation Main Menu.” The
   choices at the top of the menu will change to indicate your progress in
   installing the system. Phil Hughes wrote in the Linux Journal[1]
   that you could teach a chicken to install Debian! He meant that the
   installation process was mostly just pecking at the Enter key.
   The first choice on the installation menu is the next action that you should
   perform according to what the system detects you have already done. It
   should say “Next,” and at this point the next step in installing
   the system will be taken.
'),
('14', '1', '4', '
'),
('14', '3', '5', '
 [1]
http://www.linuxjournal.com
'),
('15', '1', '0', '
'),
('15', '1', '1', '
   Make sure the highlight is on the “Next” item and press Enter to go to
   the keyboard configuration menu.
'),
('15', '1', '2', '
'),
('15', '1', '3', '
   Move the highlight to the keyboard selection you desire and press Enter.
   Use the arrow keys to move the highlight. In most cases, you can just use
   the default U.S. layout.
'),
('16', '1', '0', '
'),
('16', '1', '1', '
   Did we tell you to back up your disks? Here’s your first chance to wipe
   out all of the data on your disks and your last chance to save your old
   system. If you haven’t backed up all of your disks, remove the floppy from
   the drive, reset the system, and run backups.
'),
('17', '1', '0', '
'),
('17', '1', '1', '
   Whatever the “Next” menu selection is, you can use the down-arrow key to
   select “Partition a Hard Disk.” Go ahead and do this now, then press
   Enter.
'),
('17', '1', '2', '
'),
('17', '1', '3', '
   The “Partition a Hard Disk” menu item presents you with a list of disk
   drives you can partition and runs a partitioning application called
   cfdisk. You must create at least one “Linux native” (type 83) disk
   partition, and you probably want at least one “Linux swap” (type 82)
   partition, as explained in later in this section.
'),
('17', '1', '4', '
'),
('17', '1', '5', '
   You will now create the partitions that you need to install Debian. For
   this example, the assumption is that you are partitioning an empty hard
   disk.
'),
('17', '1', '6', '
'),
('17', '1', '7', '
   The boot partition must reside within the first 1,024 of cylinders of your
   hard disk (see section 2.3.3 on page [*]). Keeping that in mind, use the
   right-arrow key to highlight the “New” menu selection, and then
   press Enter. You will be presented with the choice of creating a
   primary partition or a logical partition. To help ensure that
   the partition containing the boot information is within the first 1,024
   cylinders, create a primary partition first. This primary partition will be
   your “Linux native” partition.
'),
('17', '1', '8', '
'),
('17', '1', '9', '
   Highlight the “Primary” menu selection and press Enter. Next you will
   need to enter how large you want that partition to be. Review section
   2.3.2 on page [*] if you’re not sure how large it should be. Remember to
   leave enough space for your swap partition (see section 2.3.5 on page
   [*]). Enter the parition size you want and then press Enter. Next you will
   be asked if you want to place the partition at the beginning of free space
   or at the end. Place it at the beginning to help ensure that it lies
   within the first 1,024 cylinders. Highlight “Beginning” and press Enter.
   At this point you will be brought back to the main screen. Notice that the
   partition you created is listed. By default, a Linux native partition was
   created. This partition must now be made bootable. Make sure that the
   “Bootable” menu selection is highlighted and press Enter. The partition
   should now have the word “Boot” listed under the “Flags” column.
'),
('17', '1', '10', '
'),
('17', '1', '11', '
   With the remaining space, create another primary partition. Using the
   down-arrow key, highlight the free space entry in the partition list.
   Now highlight the “New” menu selection and proceed just as you
   did when you created the first primary partition. Notice that the partition
   is listed as a Linux native partition. Because this partition will be your
   swap partition, it must be denoted as such. Make sure the partition you just
   created (your swap partition) is highlighted and then press the left-arrow
   key until the “Type” menu selection is highlighted, then press
   Enter. You will be presented with a list of supported partition types. The
   Linux swap partition type should already be selected. If it is not, enter
   the number from the list that corresponds to the Linux swap partition (82),
   and then press Enter. Your swap partition should now be listed as a Linux
   swap partition under the “FS Type” column in the main screen.
'),
('17', '1', '12', '
'),
('17', '8', '13', 'alt="Figure 3.1: cfdisk screenshot" height="300" src="/images/img2.png" width="459"SPLIT!Figure 3.1: cfdisk screenshot'),
('17', '1', '14', '
'),
('17', '1', '15', '
   Your cfdisk screen should look something like the screenshot in Figure 3.1
   on page [*]. The numbers may not be the same, but the Flags and FS Type
   column shoulds be similar.
'),
('17', '1', '16', '
'),
('17', '1', '17', '
   Until now, nothing on your disk has been altered. If you are satisfied
   that the partition scheme you created is what you want, press the
   left-arrow key until “Write” is highlighted, and press Enter. Your hard
   disk has now been partitioned. Quit the cfdisk application by selecting
   the “Quit” menu selection. Once you have left cfdisk, you should be back
   in Debian’s dbootstrap installation application.
'),
('18', '1', '0', '
'),
('18', '1', '1', '
   This will be the “Next” menu item once you have created one disk
   partition. You have the choice of initializing and activating a new swap
   partition, activating a previously-initialized one, or doing without a
   swap partition.
'),
('18', '1', '2', '
'),
('18', '1', '3', '
   A swap partition is strongly recommended, but you can do without one if
   you insist and if your system has more than 4MB RAM. If you wish to do
   this, select the “Do Without a Swap Partition” item from the menu and
   move on to the next section.
'),
('18', '1', '4', '
'),
('18', '1', '5', '
   It’s always permissible to reinitialize a swap partition, so select
   “Initialize and Activate a Swap Partition” unless you are sure you know
   what you are doing. This menu choice will first present you with a dialog
   box reading “Please select the partition to activate as a swap device.”
   The default device presented should be the swap partition you’ve already
   set up; if so, just press Enter.
'),
('18', '1', '6', '
'),
('18', '1', '7', '
   Next you have the option to scan the entire partition for unreadable disk
   blocks caused by defects on the surface of the hard disk platters. This is
   useful if you have MFM, RLL, or older SCSI disks, and it never hurts
   (although it can be time-consuming). Properly working disks in most modern
   systems don’t require this step, because they have their own internal
   mechanisms for mapping out bad disk blocks.
'),
('18', '1', '8', '
'),
('18', '1', '9', '
   Finally, there is a confirmation message because initialization will
   destroy any data previously on the partition. If all is well, select
   “Yes.” The screen will flash as the initialization program runs.
'),
('19', '1', '0', '
'),
('19', '1', '1', '
   At this point, the next menu item presented should be “Initialize a Linux
   Partition.” If it isn’t, either you haven’t completed the disk
   partitioning process, or you haven’t made one of the menu choices dealing
   with your swap partition.
'),
('19', '1', '2', '
'),
('19', '1', '3', '
   You can initialize a Linux partition, or alternately you can mount a
   previously initialized one. Note that dbootstrap will not upgrade an old
   system without destroying it. If you’re upgrading, Debian can usually
   upgrade itself, and you won’t need to use dbootstrap. The Debian 2.1
   release notes contain upgrade instructions[2].
'),
('19', '1', '4', '
'),
('19', '3', '5', '
 [2]
http://www.debian.org/releases/slink/i386/release-notes/ch-upgrading-req.en.html
'),
('19', '1', '6', '
'),
('19', '1', '7', '
   If you are using old disk partitions that are not empty, i.e., if you want
   to just throw away what is on them, you should initialize them (which
   erases all files). Moreover, you must initialize any partitions that you
   created in the disk partitioning step. About the only reason to mount a
   partition without initializing it at this point would be to mount a
   partition upon which you have already performed some part of the
   installation process using this same set of installation floppies.
'),
('19', '1', '8', '
'),
('19', '1', '9', '
   Select the “Next” menu item to initialize and mount the / disk
   partition. The first partition that you mount or initialize will be the
   one mounted as / (pronounced “root”). You will be offered the choice to
   scan the disk partition for bad blocks, as you were when you initialized
   the swap partition. It never hurts to scan for bad blocks, but it could
   take 10 minutes or more to do so if you have a large disk.
'),
('19', '1', '10', '
'),
('19', '1', '11', '
   Once you’ve mounted the / partition, the “Next” menu item will be
   “Install Operating System Kernel and Modules” unless you’ve already
   performed some of the installation steps. You can use the arrow keys to
   select the menu items to initialize or to mount disk partitions if you
   have any more partitions to set up. If you have created separate
   partitions for /var, /usr, or other filesystems, you should initialize or
   mount them now.
'),
('19', '1', '12', '
'),
('19', '7', '13', '
3.7.1 Mount a Previously-Initialized Partition
'),
('19', '1', '14', '
'),
('19', '1', '15', '
   An alternative to the “Initialize a Partition” step is the “Mount a
   Previously-Initialized Partition” step. Use this if you are resuming an
   installation that was interrupted or if you want to mount partitions that
   have already been initialized.
'),
('20', '1', '0', '
'),
('20', '1', '1', '
   This should be the next menu step after you’ve mounted your root
   partition, unless you’ve already performed this step in a previous run of
   dbootstrap. First, you will be asked to confirm that the device you have
   mounted on root is the proper one. Next, you will be offered a menu of
   devices from which you can install the kernel. Choose the appropriate
   device from which to install the kernel and modules; this will either be a
   CD-ROM device or the first floppy device.
'),
('20', '1', '2', '
'),
('20', '1', '3', '
   If you’re installing from floppies, you’ll need to feed in the Rescue
   Floppy (which is probably already in the drive), followed by the Drivers
   Floppy.
'),
('21', '1', '0', '
'),
('21', '1', '1', '
   There is an alternate step, before the “Configure Device Driver
   Modules” menu selection, called “Configure PCMCIA
   Support.” This menu is used to enable PCMCIA support.
'),
('21', '1', '2', '
'),
('21', '1', '3', '
   If you do have PCMCIA but are not installing your Debian system using it
   (i.e., installation with a PCMCIA Ethernet card), you need not configure
   PCMCIA at this point. You can easily configure and enable PCMCIA at a
   later point, after installation is complete. However, if you are
   installing by way of a PCMCIA network device, this alternate must be
   selected, and PCMCIA support must be configured prior to configuring the
   network.
'),
('21', '1', '4', '
'),
('21', '1', '5', '
   If you need to install PCMCIA, select the alternate below “Configure
   Device Driver Modules.” You will be asked which PCMCIA controller your
   system contains. In most cases, this will be i82365. In some cases, it
   will be tcic; your laptop’s vendor-supplied specifications should provide
   the information. You can generally leave the next few sets of options
   blank. Again, certain hardware has special needs; the Linux PCMCIA HOWTO[3]
   contains plenty of information in case the default doesn’t work.
'),
('21', '1', '6', '
'),
('21', '3', '7', '
 [3]
http://metalab.unc.edu/LDP/HOWTO/PCMCIA-HOWTO.html
'),
('21', '1', '8', '
'),
('21', '1', '9', '
   In some unusual cases, you may also need to modify the file
   /etc/pcmcia/config.opts. You can open your second virtual terminal
   (Left Alt-F2) and edit the file there and then reconfigure your PCMCIA, or
   you can manually force a reload of the modules using insmod and rmmod.
'),
('21', '1', '10', '
'),
('21', '1', '11', '
   Once PCMCIA is properly configured and installed, you should configure
   your device drivers as described in the next section.
'),
('22', '1', '0', '
'),
('22', '1', '1', '
   Select the “Configure Device Driver Modules” menu item and look for
   devices that are on your system. Configure those device drivers, and they
   will be loaded whenever your system boots.
'),
('22', '1', '2', '
'),
('22', '1', '3', '
   You don’t have to configure all your devices at this point; what is
   crucial is that any device configuration required for the installation of
   the base system is done here.
'),
('22', '1', '4', '
'),
('22', '1', '5', '
   At any point after the system is installed, you can reconfigure your
   modules with the modconf program.
'),
('23', '1', '0', '
'),
('23', '1', '1', '
   You’ll have to configure the network even if you don’t have a
   network, but you’ll only have to answer the first two
   questions—“Choose the Host name,” and “Is your
   system connected to a network?”
'),
('23', '1', '2', '
'),
('23', '1', '3', '
   If you are connected to a network, you’ll need the information you
   collected from 2.2.1. However, if your primary connection to the network
   will be PPP, you should choose NOT to configure the network.
'),
('23', '1', '4', '
'),
('23', '1', '5', '
   dbootstrap will ask you a number of questions about your network; fill in
   the answers from 2.2.1. The system will also summarize your network
   information and ask you for confirmation. Next, you need to specify the
   network device that your primary network connection uses. Usually, this
   will be eth0 (the first Ethernet device). On a laptop, it’s more likely
   that your primary network device is pcmcia.
'),
('23', '1', '6', '
'),
('23', '1', '7', '
   Here are some technical details you may find handy: The program assumes
   the network IP address is the bitwise AND of your system’s IP address and
   your netmask. It will guess the broadcast address is the bitwise OR of
   your system’s IP address with the bitwise negation of the netmask. It will
   guess that your gateway system is also your DNS server. If you can’t find
   any of these answers, use the system’s guesses. You can change them once
   the system has been installed, if necessary, by editing
   /etc/init.d/network. (On a Debian system, daemons are started by scripts
   in the directory /etc/init.d/.)
'),
('24', '1', '0', '
'),
('24', '1', '1', '
   During the “Install the Base System” step, you’ll be offered a menu of
   devices from which you may install the base system. Here, you need to
   select your CD-ROM device.
'),
('24', '1', '2', '
'),
('24', '1', '3', '
   You will be prompted to specify the path to the base2_1.tgz file. If you
   have official Debian media, the default value should be correct.
   Otherwise, enter the path where the base system can be found, relative to
   the media’s mount point. As with the “Install Operating System Kernel and
   Modules” step, you can either let dbootstrap find the file itself or type
   in the path at the prompt.
'),
('24', '1', '4', '
'),
('24', '7', '5', '
3.12.1 Configure the Base System
'),
('24', '1', '6', '
'),
('24', '1', '7', '
   At this point you’ve read in all of the files that make up a minimal
   Debian system, but you must perform some configuration before the system
   will run.
'),
('24', '1', '8', '
'),
('24', '1', '9', '
   You’ll be asked to select your time zone. There are many ways to specify
   your time zone; we suggest you go to the “Directories:” pane and select
   your country (or continent). That will change the available time zones, so
   go ahead and select your geographic locality (i.e., country, province,
   state, or city) in the “Timezones:” pane.
'),
('24', '1', '10', '
'),
('24', '1', '11', '
   Next, you’ll be asked if your system clock is to be set to GMT or local
   time. Select GMT (i.e., “Yes”) if you will only be running Linux on your
   computer; select local time (i.e., “No”) if you will be running another
   operating system as well as Debian. Unix (and Linux is no exception)
   generally keeps GMT time on the system clock and converts visible time to
   the local time zone. This allows the system to keep track of daylight
   savings time and leap years, and even allows a user who is logged in from
   another time zone to individually set the time zone used on his or her
   terminal.
'),
('24', '1', '12', '
'),
('24', '7', '13', '
3.12.2 Make Linux Bootable Directly from the Hard Disk
'),
('24', '1', '14', '
'),
('24', '1', '15', '
   If you elect to make the hard disk boot directly to Linux, you will be asked
   to install a master boot record. If you aren’t using a boot manager
   (and this is probably the case if you don’t know what a boot manager
   is) and you don’t have another different operating system on the same
   machine, answer “Yes” to this question. Note that if you answer
   “Yes,” you won’t be able to boot into DOS normally on your
   machine, for instance. Be careful. If you answer “Yes,” the next
   question will be whether you want to boot Linux automatically from the hard
   disk when you turn on your system. This sets Linux to be the bootable
   partition—the one that will be loaded from the hard disk.
'),
('24', '1', '16', '
'),
('24', '1', '17', '
   Note that multiple operating system booting on a single machine is still
   something of a black art. This book does not even attempt to document the
   various boot managers, which vary by architecture and even by
   sub-architecture. You should see your boot manager’s documentation for
   more information. Remember: When working with the boot manager, you can
   never be too careful.
'),
('24', '1', '18', '
'),
('24', '1', '19', '
   The standard i386 boot loader is called “LILO.” It is a complex program
   that offers lots of functionality, including DOS, NT, and OS/2 boot
   management. To find out more about this functionality, you can read the
   documentation in /usr/doc/lilo after your system is set up.
'),
('25', '1', '0', '
'),
('25', '1', '1', '
   You should make a boot floppy even if you intend to boot the system from
   the hard disk. The reason is that it’s possible for the hard disk
   bootstrap to be mis-installed, but a boot floppy will almost always work.
   Select “Make a Boot Floppy” from the menu and feed the system a blank
   floppy as directed. Make sure the floppy isn’t write-protected, because
   the software will format and write it. Mark this the “Custom Boot”
   floppy and write-protect it once it has been written.
'),
('26', '1', '0', '
'),
('26', '1', '1', '
   You system’s first boot on its own power is what electrical engineers call
   the “smoke test.” If you have any floppies in your floppy drive, remove
   them. Select the “Reboot the System” menu item.
'),
('26', '1', '2', '
'),
('26', '1', '3', '
   If are booting directly into Debian and the system doesn’t start up,
   either use your original installation boot media (for instance, the Rescue
   Floppy) or insert the Custom Boot floppy if you created one, and then reset
   your system. If you are not using the Custom Boot floppy, you will
   probably need to add some boot arguments. If booting with the Rescue Floppy
   or similar technique, you need to specify rescue root=rootfs, where rootfs
   is your root partition, such as /dev/sda1.
'),
('26', '1', '4', '
'),
('26', '1', '5', '
   Debian should boot, and you should see the same messages as when you first
   booted the installation system, followed by some new messages.
'),
('27', '1', '0', '
'),
('27', '1', '1', '
   The root account is also called the superuser; it is a login
   that bypasses all security protection on your system. The root account
   should be used only to perform system administration and for as short a time
   as possible.
'),
('27', '1', '2', '
'),
('27', '1', '3', '
   Any password you create should contain from six to eight characters, and
   it should contain both uppercase and lowercase characters, as well as
   punctuation characters. Take extra care when setting your root password,
   since it is such a powerful account. Avoid dictionary words or use of any
   personal information that could be guessed.
'),
('27', '1', '4', '
'),
('27', '1', '5', '
   If anyone ever tells you he needs your root password, be extremely wary.
   You should normally never give out your root account, unless you are
   administering a machine with more than one system administrator.
'),
('28', '1', '0', '
'),
('28', '1', '1', '
   The system will ask you to create an ordinary user account. This account
   should be your main personal login. You should not use the root
   account for daily use or as your personal login.
'),
('28', '1', '2', '
'),
('28', '1', '3', '
   Why not? It’s a lot harder to do damage to the system as an ordinary
   user than as root; system files are protected. Another reason is that you
   might be tricked into running a Trojan horse program—that is, a
   program that takes advantage of your superuser powers to compromise the
   security of your system behind your back. Any good book on Unix system
   administration will cover this topic in more detail. Consider reading one if
   this topic is new to you.
'),
('28', '1', '4', '
'),
('28', '1', '5', '
   Name the user account anything you like. If your name is John Smith, you
   might use “smith,” “john,” “jsmith,” or “js.”
'),
('29', '1', '0', '
'),
('29', '1', '1', '
   Next, the system will ask whether you want to enable shadow passwords.
   This is an authentication system that makes your Linux system a bit more
   secure. Therefore, we recommend that you enable shadow passwords.
   Reconfiguration of the shadow password system can also be done later with
   the shadowconfig program.
'),
('30', '1', '0', '
'),
('30', '1', '1', '
   If you have no use for PCMCIA, you can choose to remove it at this point.
   This will make your startup cleaner; also, it will make it easier to
   replace your kernel (PCMCIA requires a lot of correlation between the
   version of the PCMCIA drivers, the kernel modules, and the kernel itself).
   In general, you will not need PCMCIA unless you’re using a laptop.
'),
('31', '1', '0', '
'),
('31', '1', '1', '
   The system will now ask you if you want to use the pre-rolled software
   configurations offered by Debian. You can always choose package-by-package
   what you want to install on your new machine. This is the purpose of the
   dselect program, described below. But this can be a long task with the
   thousands of packages available in Debian!
'),
('31', '1', '2', '
'),
('31', '1', '3', '
   So, you have the ability to choose tasks or profiles instead.
   A task is work you will do with the machine, such as “Perl
   programming” or “HTML authoring” or “Chinese word
   processing.” You can choose several tasks. A profile is a
   category your machine will be a member of, such as “Network
   server” or “Personal workstation.” Unlike with tasks, you
   can choose only one profile.
'),
('31', '1', '4', '
'),
('31', '1', '5', '
   To summarize, if you are in a hurry, choose one profile. If you have more
   time, choose the Custom profile and select a set of tasks. If you have
   plenty of time and want very precise control on what is or is not
   installed, skip this step and use the full power of dselect.
'),
('31', '1', '6', '
'),
('31', '1', '7', '
   Soon, you will enter into dselect. If you selected tasks or profiles,
   remember to skip the “Select” step of dselect, because the selections
   have already been made.
'),
('31', '1', '8', '
'),
('31', '1', '9', '
   A word of warning about the size of the tasks as they are displayed: The
   size shown for each task is the sum of the sizes of its packages. If you
   choose two tasks that share some packages, the actual disk requirement
   will be less than the sum of the sizes for the two tasks.
'),
('31', '1', '10', '
'),
('31', '1', '11', '
   Once you’ve added both logins (root and personal), you’ll be
   dropped into the dselect program. dselect allows you to select
   packages to be installed on your system. If you have a CD-ROM or hard
   disk containing the additional Debian packages that you want to install on
   your system, or if you are connected to the Internet, this will be useful to
   you right away. Otherwise, you may want to quit dselect and start it later
   after you have transported the Debian package files to your system. You must
   be the superuser (root) when you run dselect. Information on how to use
   dselect is given in section 3.20.
'),
('32', '1', '0', '
'),
('32', '1', '1', '
   It is now time to install the software packages of your choice on your
   Debian system. This is done using Debian’s package management tool,
   dselect.
'),
('32', '1', '2', '
'),
('32', '7', '3', '
3.20.1 Introduction
'),
('32', '1', '4', '
'),
('32', '1', '5', '
   This section documents dselect for first-time users. It makes no attempt
   to explain everything, so when you first meet dselect, work through the
   help screens.
'),
('32', '1', '6', '
'),
('32', '1', '7', '
   dselect is used to select which packages you wish to install (there are
   currently about 2,250 packages in Debian 2.1). It will be run for you
   during the installation. It is a very powerful and somewhat complex tool.
   As such, having some knowledge of it beforehand is highly recommended.
   Careless use of dselect can wreak havoc on your system.
'),
('32', '1', '8', '
'),
('32', '1', '9', '
   dselect will step you through the package installation process outlined
   here:
'),
('32', '1', '10', '
'),
('32', '2', '11', '
    1. Choose the access method to use.

    2. Update list of available packages, if possible.

    3. Select the packages you want on your system.

    4. Install and upgrade wanted packages.

    5. Configure any packages that are unconfigured.

    6. Remove unwanted software.
'),
('32', '1', '12', '
'),
('32', '4', '13', '
   As each step is completed successfully, dselect will lead you on to the
   next. Go through them in order without skipping any steps.
'),
('32', '1', '14', '
'),
('32', '1', '15', '
   Here and there in this document we talk of starting another shell. Linux
   has six console sessions or shells available at any one time. You switch
   between them by pressing Left Alt-F1 through Left Alt-F6, after which you
   log in on your new shell and go ahead. The console used by the install
   process is the first one, a.k.a. tty1, so press Left Alt-F1 when you want
   to return to that process.
'),
('32', '1', '16', '
'),
('32', '7', '17', '
3.20.2 Once dselect Is Launched
'),
('32', '1', '18', '
'),
('32', '1', '19', '
   Once in dselect, you will get this screen:
'),
('32', '1', '20', '
'),
('32', '2', '21', '
   Debian Linux ‘dselect’ package handling frontend.

   0.  [A]ccess  Choose the access method to use.

   1.  [U]pdate  Update list of available packages, if possible.

   2.  [S]elect  Request which packages you want on your system.

   3.  [I]nstall Install and upgrade wanted packages.

   4.  [C]onfig  Configure any packages that are unconfigured.

   5.  [R]emove  Remove unwanted software.

   6.  [Q]uit    Quit dselect.

'),
('32', '1', '22', '
'),
('32', '4', '23', '
   Let’s look at these one by one.
'),
('32', '1', '24', '
'),
('32', '7', '25', '
Access
'),
('32', '1', '26', '
'),
('32', '8', '27', 'alt="Figure 3.2: dselect Access screen" height="301" src="/images/img3.png" width="460"SPLIT!Figure 3.2: dselect Access screen'),
('32', '1', '28', '
'),
('32', '1', '29', '
   Here we tell dselect where our packages are. Ignore the order that these
   appear in. It is very important that you select the proper method for
   installation. You may have a few more methods listed, or a few less, or
   you may see them listed in a different order; just don’t worry about it.
   In the following list, we describe the different methods.
'),
('32', '1', '30', '
'),
('32', '1', '31', '
multi_cd.
           Quite large and powerful, this complex method is the recommended
           way of installing a recent version of Debian from a set of
           multiple binary CDs. Each of these CDs should contain information
           about the packages in itself and all prior CDs (in the file
           Packages.cd). When you first select this method, be sure the
           CD-ROM you will be using is not mounted. Place the last binary
           disk of the set (we don’t need the source CDs) in the drive and
           answer the questions you are asked:
'),
('32', '1', '32', '
'),
('32', '2', '33', '
   CD-ROM drive location

   Confirmation that you are using a multi-cd set

   The location of the Debian distribution on the disk(s)

   [ Possibly ] the location(s) of the Packages file(s)
'),
('32', '1', '34', '
'),
('32', '1', '35', '
   Once you have updated the available list and selected the packages to be
   installed, the multi_cd method diverges from normal procedure. You will
   need to run an “install” step for each of the CDs you have, in turn.
   Unfortunately, due to the limitations of dselect, it will not be able to
   prompt you for a new disk at each stage; the way to work for each disk is
   outlined here:
'),
('32', '1', '36', '
'),
('32', '2', '37', '
    1. Insert the CD in your CD-ROM drive.

    2. From the main dselect menu, select “Install.”

    3. Wait until dpkg finishes installing from this CD. (It may report
       installation successful, or possibly installation errors. Don’t worry
       about these until later.)

    4. Press Return to go back to the main dselect menu.

    5. Repeat with the next CD in the set.
'),
('32', '1', '38', '
'),
('32', '1', '39', '
   It may be necessary to run the installation step more than once to cover
   the order of package installation; some packages installed early may need
   to have later packages installed before they will configure properly.
'),
('32', '1', '40', '
'),
('32', '1', '41', '
   Running a “Configure” step is recommended to help fix any packages that
   may end up in this state.
'),
('32', '1', '42', '
'),
('32', '1', '43', '
multi_nfs, multi_mount. These are similar to the multi_cd method and
   are refinements on the theme of coping with changing media—for
   example, installing from a multi_cd set exported via NFS from another
   machine’s CD-ROM drive. indexdselect!multi-NFS, multi-mount
   installation
'),
('32', '1', '44', '
'),
('32', '1', '45', '
apt.
           One of the best options for installation from a local mirror of
           the Debian archive or from the network. This method uses the
           “apt” system to do complete dependency analysis and ordering, so
           it’s most likely to install packages in the optimal order.
'),
('32', '1', '46', '
'),
('32', '1', '47', '
   Configuration of this method is straightforward. You may select any number
   of different locations, mixing and matching file: URLs (local disks or NFS
   mounted disks), http: URLs, or ftp: URLs. Note, however, that the HTTP and
   FTP options do not support local authenticating proxies.
'),
('32', '1', '48', '
'),
('32', '1', '49', '
   If you have proxy server for either HTTP or FTP (or both), make sure you
   set the http_proxy and ftp_proxy environment variables, respectively. Set
   them from your shell before starting dselect by using the following
   command:
'),
('32', '1', '50', '
'),
('32', '6', '51', '
   # export http_proxy=http://gateway:3128/

   # dselect
'),
('32', '1', '52', '
'),
('32', '7', '53', '
  Update
'),
('32', '1', '54', '
'),
('32', '1', '55', '
   dselect will read the Packages or Packages.gz files from the mirror and
   create a database on your system of all available packages. This may take
   a while as it downloads and processes the files.
'),
('32', '1', '56', '
'),
('32', '7', '57', '
  Select
'),
('32', '1', '58', '
'),
('32', '1', '59', '
   Hang on to your hat. This is where it all happens. The object of the
   exercise is to select just which packages you wish to have installed.
'),
('32', '1', '60', '
'),
('32', '1', '61', '
   Press Enter. If you have a slow machine, be aware that the screen will
   clear and can remain blank for 15 seconds. So don’t start bashing keys at
   this point.
'),
('32', '1', '62', '
'),
('32', '1', '63', '
   The first thing that comes up on the screen is page 1 of the Help file.
   You can get to this help by pressing ? at any point in the “Select”
   screens, and you can page through the help screens by hitting the . (full
   stop) key.
'),
('32', '1', '64', '
'),
('32', '1', '65', '
   Before you dive in, note these points:
'),
('32', '1', '66', '
'),
('32', '9', '67', '
     ◼ To exit the “Select” screen after all selections are complete, press
       Enter. This will return you to the main screen if there is no problem
       with your selection. Otherwise, you will be asked to deal with that
       problem. When you are happy with any given screen, press Enter to get
       out.

     ◼ Problems are quite normal and are to be expected. If you select
       package A and that package requires package B to run, dselect will
       warn you of the problem and will most likely suggest a solution. If
       package A conflicts with package B (i.e., if they are mutually
       exclusive), you will be asked to decide between them.
'),
('32', '1', '68', '
'),
('32', '1', '69', '
   Let’s look at the top two lines of the Select screen. This header reminds
   us of some of the special keys listed in Table 3.1.
'),
('32', '1', '70', '
'),
('32', '5', '71', '			Table 3.1: Special dselect keys
            +------------------------------------------------------+
            | Key  |                  Description                  |
            |------+-----------------------------------------------|
            |  +   |      Select a package for installation.       |
            |------+-----------------------------------------------|
            |  =   |            Place a package on hold            |
            |------+-----------------------------------------------|
            |  -   |               Remove a package.               |
            |------+-----------------------------------------------|
            |  _   | Remove a package and its configuration files. |
            |------+-----------------------------------------------|
            | i, I |      Toggle/cycle information displays.       |
            |------+-----------------------------------------------|
            | o, O |        Cycle through the sort options.        |
            |------+-----------------------------------------------|
            | v, V |            A terse/verbose toggle.            |
            +------------------------------------------------------+
'),
('32', '1', '72', '
'),
('32', '1', '73', '
   Table 3.2 lists the states that dselect uses to denote the status of each
   package it is aware of.
'),
('32', '1', '74', '
'),
('32', '5', '75', '			Table 3.2: dselect Package States
               +-----------------------------------------------+
               | Flag |     Meaning     |   Possible values    |
               |------+-----------------+----------------------|
               |  E   |      Error      |     Space, R, I      |
               |------+-----------------+----------------------|
               |  I   | Installed State | Space, *, -, U, C, I |
               |------+-----------------+----------------------|
               |  O   |    Old Mark     |    *, -, =, _, n     |
               |------+-----------------+----------------------|
               |  M   |      Mark       |    *, -, =, _, n     |
               +-----------------------------------------------+
'),
('32', '1', '76', '
'),
('32', '1', '77', '
   Rather than spell all this out here, I refer you to the Help screens where
   all is revealed. One example, though.
'),
('32', '1', '78', '
'),
('32', '1', '79', '
   You enter dselect and find a line like this:
'),
('32', '1', '80', '
'),
('32', '2', '81', '
   EIOM Pri  Section  Package   Description

   ** Opt  misc     loadlin   a loader (running under DOS) for LINUX
'),
('32', '1', '82', '
'),
('32', '1', '83', '
   This is saying that loadlin was selected when you last ran dselect and
   that it is still selected, but it is not installed. Why not? The answer
   must be that the loadlin package is not physically available. It is
   missing from your mirror.
'),
('32', '1', '84', '
'),
('32', '1', '85', '
   The information that dselect uses to get all the right packages installed
   is buried in the packages themselves. Nothing in this world is perfect,
   and it does sometimes happen that the dependencies built into a package
   are incorrect, which means that dselect simply cannot resolve the
   situation. A way out is provided where the user can regain control; it
   takes the form of the commands Q and X, which are available in the Select
   screen.
'),
('32', '1', '86', '
'),
('32', '1', '87', '
   Q
           An override. Forces dselect to ignore the built-in dependencies
           and to do what you have specified. The results, of course, will be
           on your own head.
'),
('32', '1', '88', '
'),
('32', '1', '89', '
   X
           Use X if you get totally lost. It puts things back the way they
           were and exits.
'),
('32', '1', '90', '
'),
('32', '1', '91', '
   Select screen (dselect) Keys that help you not to get lost (!) are R, U,
   and D.
'),
('32', '1', '92', '
'),
('32', '1', '93', '
   R
           Cancels all selections at this level. Does not affect selections
           made at the previous level.
'),
('32', '1', '94', '
'),
('32', '1', '95', '
   U
           If dselect has proposed changes and you have made further changes
           U will restore dselect’s selections.
'),
('32', '1', '96', '
'),
('32', '1', '97', '
   D
           Removes the selections made by dselect, leaving only yours.
'),
('32', '1', '98', '
'),
('32', '1', '99', '
   An example follows. The boot-floppies package (not an example for
   beginners, I know, but it was chosen because it has a lot of dependencies)
   depends on these packages:
'),
('32', '1', '100', '
'),
('32', '9', '101', '
     ◼ libc6-pic

     ◼ slang1-pic

     ◼ sysutils

     ◼ makedev

     ◼ newt0.25

     ◼ newt0.25-dev

     ◼ popt

     ◼ zlib1g

     ◼ zlib1g-dev

     ◼ recode
'),
('32', '1', '102', '
'),
('32', '4', '103', '
   The person maintaining boot-floppies also thinks that the following
   packages should be installed. These are not, however, essential:
'),
('32', '1', '104', '
'),
('32', '9', '105', '
     ◼ lynx

     ◼ debiandoc-sgml

     ◼ unzip
'),
('32', '1', '106', '
'),
('32', '1', '107', '
   When you select boot-floppies, dselect brings up the conflict resolution
   screen. You’ll notice that all the required packages have been selected.
'),
('32', '1', '108', '
'),
('32', '1', '109', '
   Pressing the R key puts things back to the starting point.
'),
('32', '1', '110', '
'),
('32', '2', '111', '
   EIOM Pri Section  Package      Description

   __ Opt admin    boot-floppie Scripts to create the Debian

   __ Opt devel    newt0.25-dev Developer’s toolkit for newt

   __ Opt devel    slang1-dev   The S-Lang programming library

   __ Opt devel    slang1-pic   The S-Lang programming library
'),
('32', '1', '112', '
'),
('32', '4', '113', '
   If you decide now that you don’t want boot-floppies, just press Enter.
'),
('32', '1', '114', '
'),
('32', '1', '115', '
   Pressing the D key puts things the way I selected them in the first place:
'),
('32', '1', '116', '
'),
('32', '2', '117', '
   EIOM Pri Section  Package      Description

   _* Opt admin    boot-floppie Scripts to create the Debian
'),
('32', '1', '118', '
'),
('32', '2', '119', '
   __ Opt devel    newt0.25-dev Developer’s toolkit for newt

   __ Opt devel    slang1-dev   The S-Lang programming library

   __ Opt devel    slang1-pic   The S-Lang programming library
'),
('32', '1', '120', '
'),
('32', '4', '121', '
   Pressing the U key restores dselect’s selections:
'),
('32', '1', '122', '
'),
('32', '2', '123', '
           EIOM Pri Section  Package      Description

   _* Opt admin    boot-floppie Scripts to create the Debian installation

   _* Opt devel    newt0.25-dev Developer’s toolkit for newt

   _* Opt devel    slang1-dev   The S-Lang programming library

   _* Opt devel    slang1-pic   The S-Lang programming library
'),
('32', '1', '124', '
'),
('32', '1', '125', '
   I suggest running with the defaults for now; you will have ample
   opportunities to add more later.
'),
('32', '1', '126', '
'),
('32', '1', '127', '
   Whatever you decide, press Enter to accept and return to the main screen.
   If this results in unresolved problems, you will be bounced right back to
   another problem resolution screen.
'),
('32', '1', '128', '
'),
('32', '1', '129', '
   The R, U, and D keys are very useful in “what if” situations.
   You can experiment at will and then restore everything and start again.
   Don’t look on them as being in a glass box labeled “Break
   in Case of Emergency.”
'),
('32', '1', '130', '
'),
('32', '1', '131', '
   After making your selections in the Select screen, press I to give you a
   big window, press t to take you to the beginning, and then use the
   Page Down key to look quickly through the settings. This way you can check
   the results of your work and spot glaring errors. Some people have
   deselected whole groups of packages by mistake and not noticed the error
   until too late. dselect is a very powerful tool; don’t misuse
   it.
'),
('32', '1', '132', '
'),
('32', '1', '133', '
   You should now have the situation shown in Table 3.3.
'),
('32', '1', '134', '
'),
('32', '5', '135', '			Table 3.3: Expected Package Category States
                    +--------------------------------------+
                    | Package category |      Status       |
                    |------------------+-------------------|
                    |     Required     |   all selected    |
                    |------------------+-------------------|
                    |    Important     |   all selected    |
                    |------------------+-------------------|
                    |     Standard     |  mostly selected  |
                    |------------------+-------------------|
                    |     Optional     | mostly deselected |
                    |------------------+-------------------|
                    |      Extra       | mostly deselected |
                    +--------------------------------------+
'),
('32', '1', '136', '
'),
('32', '1', '137', '
   Happy? Press Enter to exit the Select process. You can come back and run
   Select again if you wish.
'),
('32', '1', '138', '
'),
('32', '7', '139', '
  Install
'),
('32', '1', '140', '
'),
('32', '1', '141', '
   dselect runs through the entire set of packages and installs those
   selected. Expect to be asked to make decisions as you go. It is often
   useful to switch to a different shell to compare, say, an old
   configuration with a new one. If the old file is conf.modules, the new one
   will be conf.modules.dpkg-dist.
'),
('32', '1', '142', '
'),
('32', '1', '143', '
   The screen scrolls past fairly quickly on a fast machine. You can stop and
   start it with Ctrl-s and Ctrl-q, respectively, and at the end of the run,
   you will get a list of any uninstalled packages.
'),
('32', '1', '144', '
'),
('32', '1', '145', '
   It can happen that a package does not get installed because it depends on
   some other package that is listed for installation but is not yet
   installed. The answer here is to run Install again. Cases have been
   reported where it was necessary to run it four times before everything
   slipped into place. This will vary by your acquisition method.
'),
('32', '1', '146', '
'),
('32', '7', '147', '
  Configure
'),
('32', '1', '148', '
'),
('32', '1', '149', '
   Most packages get configured in step 3, but anything left hanging can be
   configured here.
'),
('32', '1', '150', '
'),
('32', '7', '151', '
  Remove
'),
('32', '1', '152', '
'),
('32', '1', '153', '
   Removes packages that are installed but no longer required.
'),
('32', '1', '154', '
'),
('32', '7', '155', '
  Quit
'),
('32', '1', '156', '
'),
('32', '1', '157', '
   I suggest running /etc/cron.daily/find at this point, because you have a
   lot of new files on your system. Then you can use locate to get the
   location of any given file.
'),
('32', '1', '158', '
'),
('32', '7', '159', '
3.20.3 A Few Hints in Conclusion
'),
('32', '1', '160', '
'),
('32', '1', '161', '
   When the install process runs dselect for you, you will doubtless be eager
   to get Debian running as soon as possible. Well, please be prepared to take
   an hour or so to learn your way around and then get it right. When you enter
   the Select screen for the first time, don’t make any selections
   at all—just press Enter and see what dependency problems there are.
   Try fixing them. If you find yourself back at the main screen, run Select
   again.
'),
('32', '1', '162', '
'),
('32', '1', '163', '
   You can get an idea of the size of a package by pressing i twice and
   looking for the “Size” figure. This is the size of the compressed
   package, so the uncompressed files will be a lot bigger (see
   “Installed-Size,” which is in kilobytes, to know it).
'),
('32', '1', '164', '
'),
('32', '1', '165', '
   Installing a new Debian system is a complex thing, but dselect can do it
   for you as easy as can be. So take the time to learn how to drive it. Read
   the help screens and experiment with i, I, o, and O. Use the R key. It’s
   all there, but it’s up to you to use it effectively.
'),
('33', '1', '0', '
'),
('33', '1', '1', '
   The following terms will be useful to you throughout this book and in
   general when you’re talking about Debian.
'),
('33', '1', '2', '
'),
('33', '1', '3', '
Package.
           A file that contains everything needed to install, de-install, and
           run a particular program. The program that handles packages is
           dpkg. dselect is a front-end to dpkg. Experienced users often use
           dpkg to install or remove a package.
'),
('33', '1', '4', '
'),
('33', '1', '5', '
Package names.
           All package names have the form xxxxxxxxxxx.deb. Sample package
           names include the following:
'),
('33', '1', '6', '
'),
('33', '9', '7', '
     ◼ efax_08a-1.deb

     ◼ lrzsz_0.12b-1.deb

     ◼ mgetty_0.99.2-6.deb

     ◼ minicom_1.75-1.deb

     ◼ term_2.3.5-5.deb

     ◼ uucp_1.06.1-2.deb

     ◼ uutraf_1.1-1.deb

     ◼ xringd_1.10-2.deb

     ◼ xtel_3.1-2.deb
'),
('34', '1', '0', '
'),
('34', '1', '1', '
   Your system is now installed! Pat yourself on the back for a job well
   done! Now it’s time to start using the system. In this chapter, we
   introduce you to the Debian command line, some security principles, and
   how to exit the system. In later chapters, we’ll go into more detail on
   these topics and introduce you to the Debian graphical interface, X11.
'),
('35', '1', '0', '
'),
('35', '1', '1', '
   After you quit dselect, you’ll be presented with the login: prompt. You
   can now log in using the personal login and password you selected; your
   system is now ready to use. Let’s examine what it means to log in and how
   this process works.
'),
('35', '1', '2', '
'),
('35', '1', '3', '
   To use Debian, you must identify yourself to the system. This is so it
   knows who you are, what you have permission to do, and what your
   preferences are.
'),
('35', '1', '4', '
'),
('35', '1', '5', '
   To this end, you have a username or login. If you installed
   Debian yourself, you should have been asked to give such a name during
   installation. If you are logging on to a system administered by someone
   else, you’ll have to ask him for an account on the system and a
   corresponding username.
'),
('35', '1', '6', '
'),
('35', '1', '7', '
   You also have a password, so no one else can pretend to be you. If you
   don’t have a password, anyone can log on to your computer from the
   Internet and do bad things. If you’re worried about security, you should
   have a password.
'),
('35', '1', '8', '
'),
('35', '1', '9', '
   Many people prefer to trust others not to do anything malicious with their
   account; hopefully your work environment doesn’t encourage paranoia. This
   is a perfectly reasonable attitude; it depends on your personal priorities
   and your environment. Obviously a home system does not need to be as
   secure as a military installation. Debian allows you to be as secure or as
   insecure as you like.
'),
('35', '1', '10', '
'),
('35', '1', '11', '
   When you start Debian, you’ll see a prompt: a request from the
   computer for some information. In this case, the prompt is login:.
'),
('35', '1', '12', '
'),
('35', '1', '13', '
   You should type your username and, when requested, your password. The
   password does not appear on the screen as you type it. Press Enter after
   both the username and the password. If you type your username or password
   incorrectly, you’ll have to start over.
'),
('35', '1', '14', '
'),
('35', '1', '15', '
   If you do it correctly, you’ll see a brief message and then a $
   prompt. The $ is printed by a special program called the shell and is
   thus called a shell prompt. This is where you give commands to the
   system.
'),
('35', '1', '16', '
'),
('35', '1', '17', '
   Try entering the command whoami now. There is a cursor to the right
   of the shell prompt. Your cursor is a small underscore or rectangle that
   indicates where you’re typing; it should move as you type. Always
   press Enter when you’re done typing a shell command.
'),
('35', '1', '18', '
'),
('35', '1', '19', '
   whoami tells your username. You’ll then get a new shell prompt.
'),
('35', '1', '20', '
'),
('35', '1', '21', '
   For the rest of the book, when we say to enter a command, you should type
   it at the shell prompt and press the Enter key.
'),
('35', '1', '22', '
'),
('35', '1', '23', '
   When you’re done working, you may want to log out of the system. To exit
   the shell, enter the exit command. Keep in mind that if you remain logged
   in, someone could come along and use your account. Hopefully you can trust
   those in your office or home not to do this; but if you do not trust your
   environment, you should be certain to log out when you leave.
'),
('36', '1', '0', '
'),
('36', '1', '1', '
   Whatever you type after the shell prompt and before pressing Enter is called
   a command line. It’s a line of text that commands the computer
   to do something. The Debian default shell offers several features to make
   entering command lines easy.
'),
('36', '1', '2', '
'),
('36', '1', '3', '
   You can scroll up to previous commands to run them again, or you can modify
   them slightly and then run them again. Try this: Enter any command,
   such as whoami; then press the Up Arrow key. The whoami command will
   reappear at the prompt. You can then press Enter to run whoami a second
   time.
'),
('36', '1', '4', '
'),
('36', '1', '5', '
   If you’ve entered several commands, you can keep pressing the Up Arrow key
   to go back through them. This feature is handy if you’re doing the same
   thing several times, or if you type a command incorrectly and want to go
   back to fix it. You can press the Down Arrow key to move in the other
   direction, toward your more recent commands. If there are no more commands
   to move to, the computer will beep.
'),
('36', '1', '6', '
'),
('36', '1', '7', '
   You can also move around on the command line to make changes. The easiest
   way is with the Left and Right Arrow keys. Try typing whoasmi instead of
   whoami, and then use the Left Arrow key to move back to the s. You can
   erase the s with the Backspace or Delete keys.
'),
('36', '1', '8', '
'),
('36', '1', '9', '
   There are more advanced features as well (no need to memorize them all
   now, though). Try pressing Ctrl-a. This moves you to the beginning of the
   line. Ctrl-k (the k stands for “kill”) deletes all characters until the
   end of the line; try it from the middle of the command line. Using Ctrl-a
   followed by Ctrl-k, you can delete the entire command line. Ctrl-y pastes
   the last thing you killed, reinserting it at the current cursor position
   (y stands for “yank,” as in “yank it back”). Ctrl-e will move the
   cursor to the end of the command line.
'),
('36', '1', '10', '
'),
('36', '1', '11', '
   Go ahead and play around with command-line editing to get a feel for it.
   Experiment.
'),
('37', '1', '0', '
'),
('37', '1', '1', '
   Because Debian is a multiuser system, it’s designed to keep any one user
   or program from breaking the entire system. The kernel will not allow
   normal users to change important system files. This means that things stay
   the way they’re supposed to, safe from accidents, viruses, and even
   malicious pranks. Unlike other operating systems, Debian is safe from
   these threats. You won’t need an anti-virus program.
'),
('37', '1', '2', '
'),
('37', '1', '3', '
   However, sometimes you need to change important system files; for example,
   you might want to install new software or configure your network
   connection. To do so, you have to have greater powers than a normal user;
   you must become the root user (also called the superuser).
'),
('37', '1', '4', '
'),
('37', '1', '5', '
   To become root, just log on with the username root and the root password;
   this was set during installation, as described in section 3.15 on page
   [*].
'),
('37', '1', '6', '
'),
('37', '1', '7', '
   At many sites, only the system administrator has the root password, and only
   the system administrator can do the things that one must be root to do. If
   you’re using your own personal computer, you are the system
   administrator, of course. If you don’t have root privileges, you will
   have to rely on your system administrator to perform any tasks that require
   root privileges.
'),
('37', '1', '8', '
'),
('37', '1', '9', '
   Sometimes you’ll have the root password even on a shared corporate or
   educational server, because the system administrator trusts you to use it
   properly. In that case, you’ll be able to help administer the system and
   customize it for your needs. But you should be sure to use the password
   responsibly, respecting other users at all times.
'),
('37', '1', '10', '
'),
('37', '1', '11', '
   If you have the password, try logging on as root now. Enter the whoami
   command to verify your identity. Then log out immediately. When
   you’re root, the kernel will not protect you from yourself, because
   root has permission to do anything at all to the system. Don’t
   experiment while you’re root. In fact, don’t do anything as root
   unless absolutely necessary. This isn’t a matter of security, but
   rather of stability. Your system will run much better if it can keep you
   from making mistakes.
'),
('37', '1', '12', '
'),
('37', '1', '13', '
   You may find the su command more convenient than logging in as root. su
   allows you to assume the identity of another user, usually root unless you
   specify someone else. (You can remember that su stands for Super User,
   though some say it stands for Set UserID.)
'),
('37', '1', '14', '
'),
('37', '1', '15', '
   Here’s something to try. Log on as yourself—that is, not as
   root. Then your session will look something like the one in Figure 4.1.
'),
('37', '1', '16', '
'),
('37', '8', '17', 'alt="Figure 4.1: Sample session with su" height="150" src="/images/img4.png" width="390"SPLIT!Figure 4.1: Sample session with su'),
('37', '1', '18', '
'),
('37', '1', '19', '
   When you’re doing system administration tasks, you should do as much as
   possible as yourself. Then use su, do the part that requires root
   privileges, and use the exit command to turn off privileges so you can no
   longer harm anything.
'),
('37', '1', '20', '
'),
('37', '1', '21', '
   You can use su to assume the identity of any user on the system, not just
   root. To do this, type su user where user is the user you want
   to become. You’ll have to know the user’s password, of course,
   unless you’re root at the time or the user has no password.
'),
('38', '1', '0', '
'),
('38', '1', '1', '
   The Linux kernel supports virtual consoles. These provide a way of
   making your single screen and keyboard seem like multiple terminals that are
   connected to the same system. Thankfully, using virtual consoles is one of
   the simplest things about Debian: There are “hot keys” for
   switching among the consoles quickly. To try it, log in to your system and
   press Alt-F2 (simultaneously press the left Alt key, and F2, that is,
   function key number 2).
'),
('38', '1', '2', '
'),
('38', '1', '3', '
   You should find yourself at another login prompt. Don’t panic: You are
   now on virtual console (VC) number 2! Log in here and do some
   things—more whoami commands or whatever—to confirm that this is
   a real login shell. Now you can return to virtual console number 1 by
   pressing Alt-F1. Or you can move on to a third virtual console, in
   the obvious way (Alt-F3).
'),
('38', '1', '4', '
'),
('38', '1', '5', '
   Debian comes with six virtual consoles enabled by default, which you
   access with the Alt key and function keys F1 through F6. (Technically,
   there are more virtual consoles enabled, but only six of them allow you to
   log in. The others are used for the X Window system or other special
   purposes.)
'),
('38', '1', '6', '
'),
('38', '1', '7', '
   If you’re using the X Window system, it will generally start up on the
   first unused virtual console—probably VC 7. Also, to switch from the X
   virtual console to one of the first six, you’ll have to add Ctrl to
   the key sequence. So that’s Ctrl-Alt-F1 to get to VC 1. But you can go
   from a text VC to the X virtual console using only Alt. If you never leave
   X, you won’t have to worry about this; X automatically switches you to
   its virtual console when it starts up.
'),
('38', '1', '8', '
'),
('38', '1', '9', '
   Once you get used to them, virtual consoles will probably become an
   indispensable tool for getting many things done at once. (The X Window
   system serves much the same purpose, providing multiple windows rather
   than multiple consoles.) You can run a different program on each VC or log
   on as root on one VC and as yourself on another. Or everyone in the family
   can use his or her own VC; this is especially handy if you use X, in which
   case you can run several X sessions at once on different virtual consoles.
'),
('39', '1', '0', '
'),
('39', '1', '1', '
Do not just turn off the computer! You risk losing valuable data!
'),
('39', '1', '2', '
'),
('39', '1', '3', '
   If you are the only user of your computer, you might want to turn the
   computer off when you’re done with it.
'),
('39', '1', '4', '
'),
('39', '1', '5', '
   To avoid possibly weakening some hardware components, only turn off the
   computer when you’re done for the day. Power up and power down are the two
   greatest contributors to wear and tear on computer components. Turning the
   computer on and off once a day is probably the best compromise between
   your electric bill and your computer’s lifespan.
'),
('39', '1', '6', '
'),
('39', '1', '7', '
   It’s a bad thing to just press the power switch when you’re done
   using the computer. It is also bad to reboot the machine (with the Reset
   button) without first taking proper precautions. The Linux kernel, in order
   to improve performance, has a disk cache. This means it temporarily stores
   information meant for permanent storage in RAM. Because memory is thousands
   of times faster than a disk, this makes many file operations move more
   quickly. Periodically, the information Linux has in memory is actually
   written to the disk. This is called syncing. In order to turn off or
   reboot the computer safely, you’ll have to tell the computer to clear
   everything out of memory and put it in permanent storage.
'),
('39', '1', '8', '
'),
('39', '1', '9', '
   To reboot, just type reboot or press Ctrl-Alt-Del (that’s Ctrl, Alt, and
   Delete).
'),
('39', '1', '10', '
'),
('39', '1', '11', '
   To shut down, you’ll have to log in as root. As root, just type the
   command shutdown -h now. The sytem will go through the entire shutdown
   procedure, including the sync command, which clears the disk cache as
   described above. When you see System halted, it’s safe to turn off the
   computer. If you have Advanced Power Management (APM) support in your
   kernel and BIOS, the computer might shut itself off and save you the
   trouble. APM is common in laptops and is also found in certain desktop
   mainboards.
'),
('40', '1', '0', '
'),
('40', '1', '1', '
   It’s now time to explore the system in more detail. You’ve seen how to log
   in and shut down the system. In this chapter, we explore the Linux comand
   line, how Linux deals with files and directories, and some basics on
   identifying yourself to others.
'),
('41', '1', '0', '
'),
('41', '1', '1', '
   We’ve already discussed the command line—that is, commands you
   type after the shell prompt. This section describes the structure of more
   complicated command lines.
'),
('41', '1', '2', '
'),
('41', '1', '3', '
   A minimal command line contains just a command name, such as whoami. But
   other things are possible. For example, you might type: man whoami. This
   command requests the online manual for the whoami program (you may have to
   press the space bar to scroll through the documentation or press q to quit).
   A more complicated example is man -k PostScript. This command line has three
   parts. It begins with the command name, man. Then it has an option or
   switch, -k, followed by an argument, PostScript. Some people
   refer to everything except the command name as the parameters of the
   command. So, options and arguments are both parameters.
'),
('41', '1', '4', '
'),
('41', '1', '5', '
   Options change the behavior of a command, switching on particular features
   or functionality. They usually have a - before them. The GNU utilities
   also have “long forms” for the options; the long form of -k is -apropos.
   You can enter man -h or man -help to get a full list of options for the
   man command. Every command will have its own set of options, though most
   have -help and -version options. Some commands, such as tar, do not
   require the “-” before their options for historical reasons.
'),
('41', '1', '6', '
'),
('41', '1', '7', '
   Anything that isn’t an option and isn’t the command name is an
   argument (in this case, PostScript). Arguments can serve many
   purposes; most commonly, they are filenames that the command should operate
   on. In this case, PostScript is the word you want man to search for. In the
   case of man whoami, the argument was the command you wanted information
   about.
'),
('41', '1', '8', '
'),
('41', '1', '9', '
   Here’s a breakdown of the man -k PostScript command line:
'),
('41', '1', '10', '
'),
('41', '1', '11', '
   man.
           The command name, tells the computer to look at the manual pages.
           These provide documentation for commands. For example, man whoami
           will give you documentation on the whoami command.
'),
('41', '1', '12', '
'),
('41', '1', '13', '
   -k.
           The option, changes the behavior of man. Normally man expects a
           command name, such as whoami, for an argument and looks for
           documentation of that command. But with the -k or -apropos option,
           it expects the argument to be a keyword. It then gives a list of
           all manual pages with that keyword in their description.
'),
('41', '1', '14', '
'),
('41', '1', '15', '
   PostScript.
           is the argument; because we used the -k option, it’s the keyword
           to search for.
'),
('41', '1', '16', '
'),
('41', '1', '17', '
   -k and PostScript are both parameters.
'),
('41', '1', '18', '
'),
('41', '1', '19', '
   Go ahead and type man -k PostScript, and you will see a list of all the
   manual pages on your system that have something to do with PostScript. If
   you haven’t installed much software, you might see the message
   PostScript: nothing appropriate instead.
'),
('41', '1', '20', '
'),
('41', '7', '21', '
5.1.1 Describing the Command Line
'),
('41', '1', '22', '
'),
('41', '1', '23', '
   Note: You can skip this section if you want to move on.
'),
('41', '1', '24', '
'),
('41', '1', '25', '
   There’s a traditional, concise way of describing command syntax.
   Syntax means the correct ways to combine various options and arguments.
   For example, if you type man man to get the manual page about man,
   you’ll see several syntax descriptions beginning with the command name
   man. One of them will look like this: man -k [-M path] keyword ...
'),
('41', '1', '26', '
'),
('41', '1', '27', '
   Anything in brackets ([]) is an optional unit. In this case you don’t have
   to use the -M option, but if you do, you must use a path argument. You
   must use the -k option and the keyword argument. The ... means that you
   could have more of whatever came before it, so you could look up several
   keywords.
'),
('41', '1', '28', '
'),
('41', '1', '29', '
   Let’s look at one of the more complex descriptions from the man manual
   page:
'),
('41', '1', '30', '
'),
('41', '6', '31', '
   man [-c|-w|-tZT device] [-adhu7V]

   [-m system[,...]] [-L locale] [-p string]

   [-M path] [-P pager] [-r prompt] [-S list]

   [-e extension] [[section] page ...] ...
'),
('41', '1', '32', '
'),
('41', '1', '33', '
   There’s no need to go through all of this (and don’t worry about what it
   all means), but do pay attention to the organization of the description.
'),
('41', '1', '34', '
'),
('41', '1', '35', '
   First, clusters of options usually mean you can use one or more of them in
   different combinations, so -adhu7V means you can also use -h. However, you
   can’t always use all combinations; this description doesn’t make that
   clear. For example, -h is incompatible with other options, but you could
   do man -du. Unfortunately, the description’s format does not make this
   clear.
'),
('41', '1', '36', '
'),
('41', '1', '37', '
   Second, the | symbol means “or.” So you can use the -c, the -w,
   or the -tZT option, followed by a device argument.
'),
('41', '1', '38', '
'),
('41', '1', '39', '
   Third, notice that you can nest the brackets, because they indicate optional
   units. So if you have a section, you must also have a page, because e
   page is not optional within the [[section] page] unit.
'),
('41', '1', '40', '
'),
('41', '1', '41', '
   There’s no need to memorize any of this, just refer to this section as you
   read documentation.
'),
('42', '1', '0', '
'),
('42', '1', '1', '
Files are a facility for storing and organizing information,
   analogous to paper documents. They’re organized into
   directories, which are called folders on some other systems.
   Let’s look at the organization of files on a Debian system:
'),
('42', '1', '2', '
'),
('42', '1', '3', '
   /.
           A simple / represents the root directory. All other files and
           directories are contained in the root directory. If you are coming
           from the DOS/Windows world, / is very similar to what C:is for
           DOS, that is the root of the filesystem. A notable difference
           between DOS and Linux however, is that DOS keeps several
           filesystems: C: (first hard disk), A: (first floppy disk), and D:
           (either CD-ROM or second hard disk), whereas Linux has all its
           files organized above the same / root.
'),
('42', '1', '4', '
'),
('42', '1', '5', '
   /home/janeq.
           This is the home directory of user “janeq.” Reading left to
           right, to get to this directory you start in the root directory,
           enter directory home, and then enter directory janeq.
'),
('42', '1', '6', '
'),
('42', '1', '7', '
   /etc/X11/XF86Config.
           This is the configuration file for the X Window system. It resides
           in the X11 subdirectory of the /etc directory. /etc is in turn a
           subdirectory of the root directory, /.
'),
('42', '1', '8', '
'),
('42', '1', '9', '
   Things to note:
'),
('42', '1', '10', '
'),
('42', '9', '11', '
     ◼ Filenames are case-sensitive. That is, MYFILE and MyFile are
     different files.

     ◼ The root directory is referred to as simply /. Don’t confuse this
       “root” with the root user, the user on your system with “super
       powers.”

     ◼ Every directory has a name, which can contain any letters or symbols
       except /. The root directory is an exception; its name is /
       (pronounced “slash” or “the root directory”), and it cannot be
       renamed.

     ◼ While you can use almost any letters or symbols in a filename, in
       practice it’s a bad idea. It is better to avoid characters that often
       have special meanings on the command line, including: { } ( ) [ ]
       ’ ‘ " \/ > < | ; ! # & ^ * %

     ◼ Also avoid putting spaces in filenames. If you want to separate words
       in a name, good choices are the period, hyphen, and underscore. You
       could also capitalize each word, LikeThis.

     ◼ Each file or directory is designated by a fully-qualified filename,
       absolute filename, or path, giving the sequence of directories which
       must be passed through to reach it. The three terms are synonymous.
       All absolute filenames begin with the / directory, and there’s a /
       before each directory or file in the filename. The first / is the name
       of a directory, but the others are simply separators to distinguish
       the parts of the filename.

     ◼ The words used here can be confusing. Take the following example:
       /usr/share/keytables/us.map.gz. This is a fully-qualified filename;
       some people call it a path. However, people will also refer to
       us.map.gz alone as a filename.

     ◼ There is also another use for the word “path.” The intended meaning
       is usually clear from the context.

     ◼ Directories are arranged in a tree structure. All absolute filenames
       start with the root directory. The root directory has a number of
       branches, such as /etc and /usr. These subdirectories in turn branch
       into still more subdirectories, such as /etc/init.d and /usr/local.
       The whole thing together is called the “directory tree.”

     ◼ You can think of an absolute filename as a route from the base of the
       tree (/) to the end of some branch (a file). You’ll also hear people
       talk about the directory tree as if it were a family tree: Thus
       subdirectories have “parent,” and a path shows the complete ancestry
       of a file.

     ◼ There are also relative paths that begin somewhere other than the root
       directory. More on this later.

     ◼ No directory corresponds to a physical device, such as your hard disk.
       This differs from DOS and Windows, in which all paths begin with a
       device name such as C:\. The directory tree is meant to be an
       abstraction of the physical hardware, so you can use the system
       without knowing what the hardware is. All your files could be on one
       disk—or you could have 20 disks, some of them connected to a
       different computer elsewhere on the network. You can’t tell just by
       looking at the directory tree, and nearly all commands work just the
       same way no matter what physical device(s) your files are really on.
'),
('42', '1', '12', '
'),
('42', '1', '13', '
   Don’t worry if all this isn’t completely clear yet. There are many
   examples to come.
'),
('42', '1', '14', '
'),
('42', '7', '15', '
5.2.1 Using Files: A Tutorial
'),
('42', '1', '16', '
'),
('42', '1', '17', '
   To use your system, you’ll have to know how to create, move, rename, and
   delete files and directories. This section describes how to do so with the
   standard Debian commands.
'),
('42', '1', '18', '
'),
('42', '1', '19', '
   The best way to learn is to try things. As long as you aren’t root
   (and haven’t yet created any important personal files), you cannot
   mess up too seriously. Jump in—type each of these commands at the
   prompt and press Enter.
'),
('42', '1', '20', '
'),
('42', '6', '21', '
   pwd
'),
('42', '1', '22', '
'),
('42', '1', '23', '
   One directory is always considered the current working directory for
   the shell you’re using. You can view this directory with the pwd
   command, which stands for Print Working Directory. pwd prints the name of
   the directory you’re working in—probably /home/yourname.
'),
('42', '1', '24', '
'),
('42', '6', '25', '
   ls
'),
('42', '1', '26', '
'),
('42', '1', '27', '
   ls stands for “list,” as in “list files.” When you type ls, the system
   displays a list of all the files in your current working directory. If
   you’ve just installed Debian, your home directory may well be empty. If
   your working directory is empty, ls produces no output, because there are
   no files to list.
'),
('42', '1', '28', '
'),
('42', '6', '29', '
   cd /
'),
('42', '1', '30', '
'),
('42', '1', '31', '
   cd means “change directory.” In this case, you’ve asked to change to the
   root directory.
'),
('42', '1', '32', '
'),
('42', '6', '33', '
   pwd
'),
('42', '1', '34', '
'),
('42', '1', '35', '
   This verifies that you’re working in the root directory.
'),
('42', '1', '36', '
'),
('42', '6', '37', '
   ls
'),
('42', '1', '38', '
'),
('42', '1', '39', '
   Lets you see what’s in /.
'),
('42', '1', '40', '
'),
('42', '6', '41', '
   cd
'),
('42', '1', '42', '
'),
('42', '1', '43', '
   Typing cd with no arguments selects your home directory— /home/ yourname
   —as the current working directory. Try pwd to verify this.
'),
('42', '1', '44', '
'),
('42', '1', '45', '
   Before continuing, you should know that there are actually two different
   kinds of filenames. Some of them begin with /, the root directory, such as
   /etc/profile. These are called absolute filenames because they refer
   to the same file no matter what your current directory is. The other kind
   of filename is relative.
'),
('42', '1', '46', '
'),
('42', '1', '47', '
   Two directory names are used only in relative filenames: . and ...
   The directory . refers to the current directory, and .. is the parent
   directory. These are “shortcut” directories. They exist in
   every directory. Even the root directory has a parent
   directory—it’s its own parent!
'),
('42', '1', '48', '
'),
('42', '1', '49', '
   So filenames that include . or .. are relative, because their meaning
   depends on the current directory. If I’m in /usr/bin and type ../etc,
   I’m referring to /usr/etc. If I’m in /var and type ../etc,
   I’m referring to /etc. Note that a filename without the root directory
   at the front implicitly has ./ at the front. So you can type local/bin, or
   ./local/bin and it means the same thing.
'),
('42', '1', '50', '
'),
('42', '1', '51', '
   A final handy tip: The tilde ~ is equivalent to your home directory. So
   typing cd ~ is the same as typing cd with no arguments. Also, you can type
   things like cd ~/practice/mysubdirectory to change to the directory
   /home/yourname/practice/mysubdirectory. In a similar way, ~myuser is
   equivalent to the home directory of the user “myuser,” which is probably
   something like /home/myuser; so ~myuser/docs/debian.ps is equivalent to
   /home/myuser/doc/debian.ps.
'),
('42', '1', '52', '
'),
('42', '1', '53', '
   Here are some more file commands to try out, now that you know about
   relative filenames. cd to your home directory before you begin.
'),
('42', '1', '54', '
'),
('42', '6', '55', '
   mkdir practice
'),
('42', '1', '56', '
'),
('42', '4', '57', '
   In your home directory, make a directory called practice. You’ll use this
   directory to try out some other commands. You might type ls to verify that
   your new directory exists.
'),
('42', '1', '58', '
'),
('42', '6', '59', '
   cd practice
'),
('42', '1', '60', '
'),
('42', '4', '61', '
   Changes the directory to practice.
'),
('42', '1', '62', '
'),
('42', '6', '63', '
   mkdir mysubdirectory
'),
('42', '1', '64', '
'),
('42', '4', '65', '
   Creates a subdirectory of practice.
'),
('42', '1', '66', '
'),
('42', '6', '67', '
   cp /etc/profile .
'),
('42', '1', '68', '
'),
('42', '4', '69', '
   cp is short for “copy.” /etc/profile is just a random file on your
   system, don’t worry about what it is for now. We’ve copied it to . (recall
   that . just means “the directory I’m in now,” or the current working
   directory). So this creates a copy of /etc/profile and puts it in your
   practice directory. Try typing ls to verify that there’s indeed a file
   called profile in your working directory, alongside the new
   mysubdirectory.
'),
('42', '1', '70', '
'),
('42', '6', '71', '
   more profile
'),
('42', '1', '72', '
'),
('42', '4', '73', '
   This lets you view the contents of the file profile. more is used to view
   the contents of text files. It’s called more because it shows one
   screenful of the file at a time, and you press the space bar to see more.
   more will exit when you get to the end of the file, or when you press q
   (quit).
'),
('42', '1', '74', '
'),
('42', '6', '75', '
   more /etc/profile
'),
('42', '1', '76', '
'),
('42', '4', '77', '
   Verifies that the original looks just like the copy you made.
'),
('42', '1', '78', '
'),
('42', '6', '79', '
   mv profile mysubdirectory
'),
('42', '1', '80', '
'),
('42', '4', '81', '
   mv stands for “move.” You’ve moved the file profile from the current
   directory into the subdirectory you created earlier.
'),
('42', '1', '82', '
'),
('42', '6', '83', '
   ls
'),
('42', '1', '84', '
'),
('42', '4', '85', '
   Verifies that profile is no longer in the current directory.
'),
('42', '1', '86', '
'),
('42', '6', '87', '
   ls mysubdirectory
'),
('42', '1', '88', '
'),
('42', '4', '89', '
   Verifies that profile has moved to mysubdirectory.
'),
('42', '1', '90', '
'),
('42', '6', '91', '
   cd mysubdirectory
'),
('42', '1', '92', '
'),
('42', '4', '93', '
   Changes to the subdirectory.
'),
('42', '1', '94', '
'),
('42', '6', '95', '
   mv profile myprofile
'),
('42', '1', '96', '
'),
('42', '4', '97', '
   Note that unlike some operating systems, there is no difference between
   moving a file and renaming it. Thus there’s no separate rename command.
   Note that the second argument to mv can be a directory to move the file or
   directory into, or it can be a new filename. cp works the same way.
'),
('42', '1', '98', '
'),
('42', '1', '99', '
   As usual, you can type ls to see the result of mv.
'),
('42', '1', '100', '
'),
('42', '6', '101', '
   mv myprofile ..
'),
('42', '1', '102', '
'),
('42', '4', '103', '
   Just as . means “the directory I’m in now,” .. means “parent of the
   current directory,” in this case the practice directory you created
   earlier. Use ls to verify that that’s where myprofile is now.
'),
('42', '1', '104', '
'),
('42', '6', '105', '
   cd ..
'),
('42', '1', '106', '
'),
('42', '4', '107', '
   Changes directories to the parent directory—in this case practice, where
   you just put myprofile.
'),
('42', '1', '108', '
'),
('42', '6', '109', '
   rm myprofile
'),
('42', '1', '110', '
'),
('42', '4', '111', '
   rm means “remove,” so this deletes myprofile. Be careful!
   Deleting a file on a GNU/Linux system is permanent—there is no
   undelete. If you rm it, it’s gone, forever. Be careful! To
   repeat, deleting a file on a GNU/Linux system is
   permanent—there is no undelete. If you rm it, it’s
   gone, forever.
'),
('42', '1', '112', '
'),
('42', '6', '113', '
   rmdir mysubdirectory
'),
('42', '1', '114', '
'),
('42', '4', '115', '
   rmdir is just like rm, only it’s for directories. Notice that rmdir only
   works on empty directories. If the directory contains files, you must
   delete those files first, or alternatively you can use rm -r in place of
   rmdir.
'),
('42', '1', '116', '
'),
('42', '6', '117', '
   cd ..
'),
('42', '1', '118', '
'),
('42', '4', '119', '
   This moves out of the current directory, and into its parent directory.
   Now you can type the following:
'),
('42', '1', '120', '
'),
('42', '6', '121', '
   rmdir practice
'),
('42', '1', '122', '
'),
('42', '4', '123', '
   This will delete the last remnants of your practice session.
'),
('42', '1', '124', '
'),
('42', '1', '125', '
   So now you know how to create, copy, move, rename, and delete files and
   directories. You also learned some shortcuts, like typing simply cd to jump
   to your home directory, and how . and .. refer to the current directory and
   its parent, respectively. You should also remember the concept of the
   root directory, or /, and the alias ~ for your home directory.
'),
('42', '1', '126', '
'),
('42', '7', '127', '
5.2.2 Dot Files and ls -a
'),
('42', '1', '128', '
'),
('42', '1', '129', '
   When you type ls, files beginning with a dot are not listed.
   Traditionally, files that contain configuration information, user
   preferences, and so on begin with a dot; these are hidden and out of your
   way while you do your day-to-day work. Sample dot files are ~/.emacs,
   ~/.newsrc, ~/.bashrc, ~/.xsession, and ~/.fvwmrc. These are used by Emacs,
   news readers, the Bash shell, the X Window system, and the fvwm window
   manager, respectively. It is conventional to end the dot filename with rc,
   but some programs don’t. There are also directories beginning with a dot,
   such as ~/.gimp and ~/.netscape, which store preferences for the Gimp and
   Netscape.
'),
('42', '1', '130', '
'),
('42', '1', '131', '
   Sometimes a program will create a dot file automatically; for example,
   Netscape allows you to edit your preferences with a graphical dialog box
   and then it saves your choices. Other times you will create them yourself
   using a text editor; this is the traditional way to do it, but you have to
   learn the peculiar format of each file—inconvenient at first, but it can
   give you a lot of power.
'),
('42', '1', '132', '
'),
('42', '1', '133', '
   To see dot files, you must use the -a option to ls. The long form of -a is
   -all, if you find that easier to remember. You can also use -A or
   -almost-all, which displays all dot files except . and ... Remember that .
   is the current directory, and .. is the parent of the current directory;
   because these are guaranteed to be in every directory, there is no real
   reason to list them with ls. You already know they are there.
'),
('43', '1', '0', '
'),
('43', '1', '1', '
   We mentioned before that GNU/Linux is a multitasking system. It can
   do many tasks at once. Each of these tasks is called a process. The
   best way to get a sense of this is to type top at the shell prompt.
   You’ll get a list of processes, sorted according to how much of the
   computer’s processing time they’re using. The order will
   continuously change before your eyes. At the top of the display,
   there’s some information about the system: how many users are logged
   in, how many total processes there are, how much memory you have and how
   much you’re using.
'),
('43', '1', '2', '
'),
('43', '1', '3', '
   In the far left column, you’ll see the user owning each process. The far
   right column shows which command invoked the process. You’ll probably
   notice that top itself, invoked by you, is near the top of the list
   (because anytime top checks on CPU usage, it will be active and using CPU
   to do the check).
'),
('43', '1', '4', '
'),
('43', '1', '5', '
   Note that in all the commands ending in “d” —such as kflushd and inetd
   —the “d” stands for daemon.
'),
('43', '1', '6', '
'),
('43', '1', '7', '
   Daemon originally meant Disks And Extensions MONitor. A daemon is a
   non-interactive process, that is, it’s run by the system and users never
   have to worry about it. Daemons provide services like Internet
   connectivity, printing, or e-mail.
'),
('43', '1', '8', '
'),
('43', '1', '9', '
   Now press u and give top your username when it asks. The u command asks to
   see only those processes belonging to you; it allows you to ignore all the
   daemons and whatever other people are doing. You might notice bash, the
   name of your shell. You’ll pretty much always be running bash.
'),
('43', '1', '10', '
'),
('43', '1', '11', '
   Note that column two of the top display shows you the PID, or Process
   IDentification number. Each process is assigned a unique PID. You can use
   the PID to control individual processes (more on that later). Another useful
   trick is to press ? to get a list of top commands.
'),
('43', '1', '12', '
'),
('43', '1', '13', '
   You may wonder about the difference between a “process” and a
   “program.” In practice, people use the terms interchangeably.
   Technically, the program is the set of instructions written by a
   programmer and kept on disk. The process is the working instantiation
   of the program kept in memory by Linux. But it’s not that important to
   keep the terms straight.
'),
('43', '1', '14', '
'),
('43', '1', '15', '
   Much of your interaction with a computer involves controlling processes.
   You’ll want to start them, stop them, and see what they’re up
   to. Your primary tool for this is the shell.
'),
('44', '1', '0', '
'),
('44', '1', '1', '
   The shell is a program that allows you to interact with your
   computer. It’s called a shell because it provides an environment for
   you to work in—sort of a little electronic home for you as you
   compute. (Think hermit crab.)
'),
('44', '1', '2', '
'),
('44', '1', '3', '
   The simplest function of the shell is to launch other programs. You type
   the name of the program you want to run, followed by the arguments you
   want, and the shell asks the system to run the program for you.
'),
('44', '1', '4', '
'),
('44', '1', '5', '
   Of course, graphical windowing systems also fill this need. Technically,
   Windows 95 provides a graphical shell, and the X Window system is another
   kind of graphical shell. But “shell” is commonly used to mean
   “command-line shell.”
'),
('44', '1', '6', '
'),
('44', '1', '7', '
   Needless to say, the hackers who work on shells aren’t satisfied with
   simply launching commands. Your shell has a bewildering number of
   convenient and powerful features if you would like to take advantage of
   them.
'),
('44', '1', '8', '
'),
('44', '1', '9', '
   There are countless different shells available; most are based on either the
   Bourne shell or the C shell, two of the oldest shells. The
   original Bourne shell’s program name is sh, while csh is the C shell.
   Bourne shell variants include the Bourne Again Shell from the GNU project
   (bash, the Debian default), the Korn shell (ksh), and the Z shell (zsh).
   There is also ash, a traditional implementation of the Bourne shell. The
   most common C shell variant is tcsh (the t pays tribute to the TENEX and
   TOPS-20 operating systems, which inspired some of tcsh’s improvements
   over csh).
'),
('44', '1', '10', '
'),
('44', '1', '11', '
   bash is probably the best choice for new users. It is the default and has
   all the features you’re likely to need. But all the shells have loyal
   followings; if you want to experiment, install some different shell
   packages and change your shell with the chsh command. Just type chsh,
   supply a password when asked, and choose a shell. When you next log in,
   you’ll be using the new shell.
'),
('45', '1', '0', '
'),
('45', '1', '1', '
   Debian is a multitasking system, so you need a way to do more than one
   thing at once. Graphical environments like X provide a natural way to do
   this; they allow multiple windows on the screen at any one time.
   Naturally, bash (or any other shell) provides similar facilities.
'),
('45', '1', '2', '
'),
('45', '1', '3', '
   Earlier you used top to look at the different processes on the system. Your
   shell provides some convenient ways to keep track of only those processes
   you’ve started from the command line. Each command line starts a
   job (also called a process group) to be carried out by the
   shell. A job can consist of a single process or a set of processes in a
   pipeline (more on pipelines later).
'),
('45', '1', '4', '
'),
('45', '1', '5', '
   Entering a command line will start a job. Try typing man cp, and the cp
   manual page will appear on the screen. The shell will go into the
   background and return when you finish reading the manual page (or you can
   press q to quit rather than scrolling through the whole thing).
'),
('45', '1', '6', '
'),
('45', '1', '7', '
   But say you’re reading the manual page, and you want to do something
   else for a minute. No problem. Press Ctrl-z while you’re reading to
   suspend the current foreground job and put the shell in the
   foreground. When you suspend a job, bash will first give you some
   information on it, followed by a shell prompt. You will see something like
   this on the screen:
'),
('45', '1', '8', '
'),
('45', '2', '9', '
   NAME cp - copy files SYNOPSIS cp [options] source

   --More--

   [1]+ Stopped man cp

   $
'),
('45', '1', '10', '
'),
('45', '1', '11', '
   Note the last two lines. The next to last is the job information, and then
   you have a shell prompt.
'),
('45', '1', '12', '
'),
('45', '1', '13', '
   bash assigns a job number to each command line you run from the
   shell. This allows you to refer to the process easily. In this case, man cp
   is job number 1, displayed as [1]. The + means that this is the last job you
   had in the foreground. bash also tells you the current state of the
   job—Stopped—and the job’s command line.
'),
('45', '1', '14', '
'),
('45', '1', '15', '
   There are many things you can do with jobs. With man cp still suspended,
   try the following commands:
'),
('45', '1', '16', '
'),
('45', '6', '17', '
   man ls
'),
('45', '1', '18', '
'),
('45', '4', '19', '
   Starts a new job.
'),
('45', '1', '20', '
'),
('45', '6', '21', '
   Ctrl-z
'),
('45', '1', '22', '
'),
('45', '4', '23', '
   Suspends the man ls job; you should see its job information.
'),
('45', '1', '24', '
'),
('45', '6', '25', '
   man mv
'),
('45', '1', '26', '
'),
('45', '4', '27', '
   Starts yet another job.
'),
('45', '1', '28', '
'),
('45', '6', '29', '
   Ctrl-z
'),
('45', '1', '30', '
'),
('45', '4', '31', '
   Suspends it.
'),
('45', '1', '32', '
'),
('45', '6', '33', '
   jobs
'),
('45', '1', '34', '
'),
('45', '4', '35', '
   Asks bash for a display of current jobs. The result looks like this:
'),
('45', '1', '36', '
'),
('45', '6', '37', '
   {$} jobs

   [1] Stopped man cp

   [2]- Stopped man ls

   [3]+ Stopped man mv

   {$}
'),
('45', '1', '38', '
'),
('45', '4', '39', '
   Notice the - and +, denoting respectively the next to last and last
   foreground jobs.
'),
('45', '1', '40', '
'),
('45', '6', '41', '
   fg
'),
('45', '1', '42', '
'),
('45', '4', '43', '
   Places the last foreground job (man mv, the one with the +) in the
   foreground again. If you press the space bar, the man page will continue
   scrolling.
'),
('45', '1', '44', '
'),
('45', '6', '45', '
   Ctrl-z
'),
('45', '1', '46', '
'),
('45', '4', '47', '
   Re-suspends man mv.
'),
('45', '1', '48', '
'),
('45', '6', '49', '
   fg %1
'),
('45', '1', '50', '
'),
('45', '4', '51', '
   You can refer to any job by placing a % in front of its number. If you use
   fg without specifying a job, the last active one is assumed.
'),
('45', '1', '52', '
'),
('45', '6', '53', '
   Ctrl-z
'),
('45', '1', '54', '
'),
('45', '4', '55', '
   Re-suspends man cp.
'),
('45', '1', '56', '
'),
('45', '6', '57', '
   kill %1
'),
('45', '1', '58', '
'),
('45', '4', '59', '
   Kills off job 1. bash will report the job information, which will look
   like this:
'),
('45', '1', '60', '
'),
('45', '6', '61', '
   $ kill %1

   [1]- Terminated man cp

           $
'),
('45', '1', '62', '
'),
('45', '4', '63', '
   bash is only asking the job to quit, and sometimes a job will not want to
   do so. If the job doesn’t terminate, you can add the -KILL[1]
   option to kill to stop asking and start demanding. For example:
'),
('45', '1', '64', '
'),
('45', '3', '65', '
 [1]
Many people use the signal number -9 instead of the signal name -KILL. However,
it’s technically more portable to use the signal name.
'),
('45', '1', '66', '
'),
('45', '6', '67', '
   $ kill -KILL %1

   [1]- Killed man mv

   $
'),
('45', '1', '68', '
'),
('45', '4', '69', '
   The -KILL option forcibly and unconditionally kills off the job.
'),
('45', '1', '70', '
'),
('45', '1', '71', '
   In technical terms, kill simply sends a signal. By default, it sends a
   signal that requests termination (TERM, or signal 15) but you can also
   specify a signal, and signal 9 (KILL) is the signal that forces
   termination. The command name kill is not necessarily appropriate to the
   signal sent; for example, sending the TSTP (terminal stop) signal suspends
   the process but allows it to be continued later.
'),
('45', '1', '72', '
'),
('45', '6', '73', '
   top
'),
('45', '1', '74', '
'),
('45', '4', '75', '
   This brings the top display back up. Give the u command in top to see only
   your processes. Look in the right-hand column for the man ls and man mv
   commands. man cp won’t be there because you killed it. top is showing you
   the system processes corresponding to your jobs; notice that the PID on
   the left of the screen does not correspond to the job number.
'),
('45', '1', '76', '
'),
('45', '1', '77', '
   You may not be able to find your processes because they’re off the bottom
   of the screen; if you’re using X (see Chapter 9 on page [*]), you can
   resize the xterm to solve this problem.
'),
('45', '1', '78', '
'),
('45', '1', '79', '
   Even these simple jobs actually consist of multiple processes, including
   the man process and the pager more, which handles scrolling one page at a
   time. You may notice the more processes are also visible in top.
'),
('45', '1', '80', '
'),
('45', '1', '81', '
   You can probably figure out how to clean up the remaining two jobs. You
   can either kill them (with the kill command) or foreground each one (with
   fg) and exit it. Remember that the jobs command gives you a list of
   existing jobs and their status.
'),
('45', '1', '82', '
'),
('45', '1', '83', '
   One final note: The documentation for bash is quite good, but it is found
   in the Info help system rather than the man pages. To read it, type info
   bash. See section A.1.1 for instructions on using the info program. bash
   also contains a very good summary of its commands accessible by the help
   command. help displays a list of available topics; more information about
   each of them is accessible with the command help topic name. Try typing
   help cd, for example. This will give you details on the -P and -L
   arguments recognized by cd.
'),
('46', '1', '0', '
'),
('46', '1', '1', '
   This section mentions just a few of the most commonly used Bash features;
   for a more complete discussion see Chapter 6.
'),
('46', '1', '2', '
'),
('46', '7', '3', '
5.6.1 Tab Completion
'),
('46', '1', '4', '
'),
('46', '1', '5', '
   The bash shell can guess what filename or command you are trying to type
   and automatically finish typing it for you. Just type the beginning of a
   command or filename and press Tab. If bash finds a single unique
   completion, it will finish the word and put a space after it. If it finds
   multiple possible completions, it will fill out the part all completions
   have in common and beep. You can then enter enough of the word to make it
   unique and press Tab again. If it finds no completions, it will simply
   beep.
'),
('47', '1', '0', '
'),
('47', '1', '1', '
   Unix-like systems are multiuser, and so you have your own electronic
   identity as a user on the system. Type finger yourusername to look at
   some of the information about you that’s publically available. To
   change the name and shell listed there, you can use the commands chfn and
   chsh. Only the superuser can change your login (username) and directory.
   You’ll notice that it says “No plan.” A “plan”
   is just some information you can make available to others. To create a plan,
   you put whatever information you want people to see in a file called .plan.
   To do this you’ll use a text editor; see section 8.2 on page [*]. Then
   finger yourself to see your plan. Others can finger you to see your plan and
   to check whether you’ve received new mail or read your mail.
'),
('47', '1', '2', '
'),
('47', '1', '3', '
   Note that this finger information is available to the entire Internet by
   default. If you don’t want this, read about configuring inetd and the file
   /etc/services. Eventually the installation manual will describe this
   configuration, but for now you might try the man pages or just put
   nonsense in for your finger information.
'),
('48', '1', '0', '
'),
('48', '1', '1', '
   As you have been reading this book, you’ve been interacting with the shell
   already. The shell is the program that reads your commands and then does
   what you ask it to. In this chapter, you explore the shell in greater
   detail, with a special eye towards customizing the shell to work as you
   want it to.
'),
('49', '1', '0', '
'),
('49', '1', '1', '
   Every process has an environment associated with it. An environment
   is a collection of environment variables. A variable is a changeable
   value with a fixed name. For example, the name EMAIL could refer to the
   value joe@nowhere.com. The value can vary; EMAIL could also refer to
   jane@somewhere.com.
'),
('49', '1', '2', '
'),
('49', '1', '3', '
   Because your shell is a process like any other, it has an environment. You
   can view your shell’s environment by entering the printenv command. Figure
   6.1 has some sample output from printenv. On your system, the output will be
   different but similar.
'),
('49', '1', '4', '
'),
('49', '8', '5', 'alt="Figure 6.1: Sample printenv output" height="357" src="/images/img5.png" width="333"SPLIT!Figure 6.1: Sample printenv output'),
('49', '1', '6', '
'),
('49', '1', '7', '
   Environment variables are one way to configure the system. For example,
   the EDITOR variable lets you select your preferred editor for posting
   news, writing e-mail, and so on.
'),
('49', '1', '8', '
'),
('49', '1', '9', '
   Setting environment variables is simple. For practice, try customizing
   your shell’s prompt and your text file viewer with environment variables.
   First, let’s get a bit of background information.
'),
('49', '1', '10', '
'),
('49', '6', '11', '
   man less
'),
('49', '1', '12', '
'),
('49', '4', '13', '
   This command lets you view the online manual for the less command. In
   order to show you the text one screenful at a time, man invokes a pager
   that shows you a new page of text each time you press the space bar. By
   default, it uses the pager called more.
'),
('49', '1', '14', '
'),
('49', '1', '15', '
   Go ahead and glance over the man page for less, which is an enhanced
   pager. Scroll to a new page by pressing space; press q to quit. more will
   also quit automatically when you reach the end of the man page.
'),
('49', '1', '16', '
'),
('49', '6', '17', '
   export PAGER=less
'),
('49', '1', '18', '
'),
('49', '4', '19', '
   After reading about the advantages of less, you might want to use it to
   read man pages. To do this, you set the environment variable PAGER.
'),
('49', '1', '20', '
'),
('49', '1', '21', '
   The command to set an environment variable within bash always has this
   format:
'),
('49', '1', '22', '
'),
('49', '8', '23', 'alt="Figure 6.2: Changing the prompt" height="108" src="/images/img6.png" width="234"SPLIT!Figure 6.2: Changing the prompt'),
('49', '1', '24', '
'),
('49', '6', '25', '
   export NAME=value
'),
('49', '1', '26', '
'),
('49', '4', '27', '
   export means to move the variable from the shell into the environment.
   This means that programs other than the shell (for instance, a file
   viewer) will be able to access it.
'),
('49', '1', '28', '
'),
('49', '6', '29', '
   echo $PAGER
'),
('49', '1', '30', '
'),
('49', '4', '31', '
   This is the easiest way to see the value of a variable. $PAGER tells the
   shell to insert the value of the PAGER variable before invoking the
   command. echo echoes back its argument: in this case, it echoes the current
   PAGER value, less.
'),
('49', '1', '32', '
'),
('49', '6', '33', '
   man more
'),
('49', '1', '34', '
'),
('49', '4', '35', '
   Displays the more manual. This time, man should have invoked the less
   pager.
'),
('49', '1', '36', '
'),
('49', '1', '37', '
   less has lots of features that more lacks. For example, you can scroll
   backward with the b key. You can also move up and down (even sideways)
   with the arrow keys. less won’t exit when it reaches the end of the man
   page; it will wait for you to press q.
'),
('49', '1', '38', '
'),
('49', '1', '39', '
   You can try out some less-specific commands, like b, to verify that they
   don’t work with more and that you are indeed using more.
'),
('49', '1', '40', '
'),
('49', '6', '41', '
   unset PAGER
'),
('49', '1', '42', '
'),
('49', '4', '43', '
   If you don’t want to specify a pager anymore, you can unset the variable.
   man will then use more by default, just as it did before you set the
   variable.
'),
('49', '1', '44', '
'),
('49', '6', '45', '
   echo $PAGER
'),
('49', '1', '46', '
'),
('49', '4', '47', '
   Because PAGER has been unset, echo won’t print anything.
'),
('49', '1', '48', '
'),
('49', '6', '49', '
   PS1=hello:
'),
('49', '1', '50', '
'),
('49', '4', '51', '
   Just for fun, change your shell prompt. $ should now change; see Figure
   6.2 for details.
'),
('49', '1', '52', '
'),
('49', '1', '53', '
   export is not necessary, because you’re changing the shell’s own
   behavior. There’s no reason to export the variable into the
   environment for other programs to see. Technically, PS1 is a shell
   variable rather than an environment variable.
'),
('49', '1', '54', '
'),
('49', '1', '55', '
   If you wanted to, you could export the shell variable, transforming it
   into an environment variable. If you do this, programs you run from the
   shell can see it.
'),
('50', '1', '0', '
'),
('50', '1', '1', '
   When you type a command into the shell, it has to find the program on your
   hard disk before executing it. If the shell had to look all over the disk,
   it would be very slow; instead, it looks in a list of directories contained
   in the PATH environment variable. This list of directories makes up the
   shell’s search path; when you enter a command, it goes through
   each one in turn looking for the program you asked to run.
'),
('50', '1', '2', '
'),
('50', '1', '3', '
   You may need to change the PATH variable if you install programs yourself
   in a non-standard location. The value of PATH is a colon-separated list of
   directories. The default value on Debian systems is as follows:
'),
('50', '1', '4', '
'),
('50', '6', '5', '
   /usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games
'),
('50', '1', '6', '
'),
('50', '1', '7', '
   This value is defined in the file /etc/profile and applies to all users.
   You can easily change the value, just as you can change any environment
   variable. If you type the command ls, the shell will first look in
   /usr/local/bin; ls isn’t there, so it will try /usr/bin; when that fails,
   it will check /bin. There it will discover /bin/ls, stop its search, and
   execute the program /bin/ls. If /usr/bin/X11/ls existed (it doesn’t, but
   pretend), it would be ignored.
'),
('50', '1', '8', '
'),
('50', '1', '9', '
   You can see which ls the shell is going to use with the type command.
   type ls will give you the answer /bin/ls. Try it yourself.
'),
('50', '1', '10', '
'),
('50', '1', '11', '
   Try asking where type itself resides:
'),
('50', '1', '12', '
'),
('50', '6', '13', '
   $ type type

   type is a shell builtin
'),
('50', '1', '14', '
'),
('50', '4', '15', '
   type isn’t actually a program; it’s a function provided by the shell.
   However, you use it just like an external program.
'),
('50', '1', '16', '
'),
('50', '1', '17', '
   There are a number of commands like this; type man builtins to read the
   man page describing them. In general, you don’t need to know whether a
   command is a builtin or a real program; however, builtins will not show up
   in the output of ps or top because they aren’t separate processes. They’re
   just part of the shell.
'),
('51', '1', '0', '
'),
('51', '1', '1', '
   Many applications on Linux systems allow you to alter how they behave at
   certain times by altering files containing configuration information.
   These configuration files may contain application start-up information,
   run-time settings and application shutdown settings. In general, a
   configuration filename is based on the name of the application for which
   it contains settings. Such a naming convention allows you to more readily
   determine which configuration file contains settings for a given
   application.
'),
('51', '1', '2', '
'),
('51', '7', '3', '
6.3.1 System-Wide Versus User-Specific
Configuration
'),
('51', '1', '4', '
'),
('51', '1', '5', '
   It’s important to remember that there are two different kinds of
   configurations on a Debian system. System-wide configuration affects
   all users. System-wide settings are made in the /etc directory, so you
   generally must be root in order to change system-wide settings. You might
   configure the way the system connects to the Internet, for example, or have
   web browsers on the system always start on the company home page. Since you
   want these settings to apply to all users, you make the changes in /etc.
   Sample configuration files in /etc include /etc/X11/XF86Config,
   /etc/lynx.cfg, and /etc/ppp/options. In fact, nearly all the files in /etc
   are configuration files.
'),
('51', '1', '6', '
'),
('51', '1', '7', '
User configuration affects only a single user. Dotfiles are used for
   user configuration. For example, the file ~/.newsrc stores a list of which
   USENET (discussion group) articles you have read and which groups you
   subscribe to. This allows news readers such as trn or GNUS to display unread
   articles in the groups you’re interested in. This information will be
   different for every user on the system, so each user has his own .newsrc
   file in his home directory.
'),
('52', '1', '0', '
'),
('52', '1', '1', '
   If you use the same command often, you might get tired of typing it. bash
   lets you write shorter aliases for your commands.
'),
('52', '1', '2', '
'),
('52', '1', '3', '
   Say you always use the -almost-all and -color=auto options to ls. You
   quickly get tired of typing ls -almost-all -color=auto. So you make an
   alias:
'),
('52', '1', '4', '
'),
('52', '6', '5', '
   alias myls=’ls -almost-all -color=auto’
'),
('52', '1', '6', '
'),
('52', '4', '7', '
   Now you can type myls instead of the full command. To see what myls really
   is, run the command type myls. To see a list of aliases you’ve defined,
   simply type alias on a line by itself.
'),
('52', '1', '8', '
'),
('52', '8', '9', 'alt="Figure 6.3: Redirecting output" height="71" src="/images/img7.png" width="176"SPLIT!Figure 6.3: Redirecting output'),
('53', '1', '0', '
'),
('53', '1', '1', '
   Throughout your experiences with Linux, you will most likely find that
   manipulating application input and output can be a very powerful thing to
   do. This section describes some of the things that controlling input and
   output can do for you.
'),
('53', '1', '2', '
'),
('53', '7', '3', '
6.5.1 stdin, stdout, Pipelines, and Redirection
'),
('53', '1', '4', '
'),
('53', '1', '5', '
   Every process has at least three connections to the outside world. The
   standard input is one source of the process’s data; the
   standard output is one place the process sends data; and the
   standard error is a place the process can send error messages. (These
   are often abbreviated stdin, stdout, and stderr.)
'),
('53', '1', '6', '
'),
('53', '1', '7', '
   The words “source” and “place” are intentionally vague. These standard
   input and output locations can be changed by the user; they could be the
   screen, the keyboard, a file, even a network connection. You can specify
   which locations to use.
'),
('53', '1', '8', '
'),
('53', '1', '9', '
   When you run a program from the shell, usually standard input comes from
   your keyboard, and standard output and error both go to your screen.
   However, you can ask the shell to change these defaults.
'),
('53', '1', '10', '
'),
('53', '1', '11', '
   For example, the echo command sends it output to standard output, normally
   the screen. But you can send it to a file instead with the output
   redirection operator, >. For example, to put the word
   “Hello” in the file myfile, use this command:
'),
('53', '1', '12', '
'),
('53', '6', '13', '
   echo Hello > myfile
'),
('53', '1', '14', '
'),
('53', '4', '15', '
   Use cat or your text file pager (more or less) to view myfile’s contents;
   see Figure 6.3.
'),
('53', '1', '16', '
'),
('53', '1', '17', '
   You can change the standard input of a command with the input redirection
   operator, <. For example, cat < myfile will display the contents
   of myfile. This is not useful in practice; for convenience, the cat command
   accepts a filename argument. So you can simply say cat myfile, and the
   effect will be the same. redirection operators
'),
('53', '1', '18', '
'),
('53', '1', '19', '
   Under the hood, cat < myfile means that the shell opens myfile and then
   feeds its contents to the standard input of cat. cat myfile, without the
   redirection operator, means that the cat command receives one argument
   (myfile) opens the file itself, and then displays the file.
'),
('53', '1', '20', '
'),
('53', '1', '21', '
   There’s a reason for the double functionality, however. For example, you
   can connect the standard output of one command to the standard input of
   another. This is called a pipeline, and it uses the pipe operator[1], |.
'),
('53', '1', '22', '
'),
('53', '3', '23', '
 [1]
Depending on your keyboard, this may either appear as a vertical bar or a
broken vertical bar, but it can almost always be found above the backslash (\).
'),
('53', '1', '24', '
'),
('53', '1', '25', '
   Perhaps you want to see the GNU General Public License in reverse. To do
   this, you use the tac command (it’s cat, only backward). Try it out:
'),
('53', '1', '26', '
'),
('53', '6', '27', '
   tac /usr/doc/copyright/GPL
'),
('53', '1', '28', '
'),
('53', '4', '29', '
   Unfortunately, it goes by too quickly to read. So you only get to see a
   couple of paragraphs. The solution is a pipeline:
'),
('53', '1', '30', '
'),
('53', '6', '31', '
   tac /usr/doc/copyright/GPL | less
'),
('53', '1', '32', '
'),
('53', '4', '33', '
   This takes the standard output of tac, which is the GPL in reverse, and
   sends it to the standard input of less.
'),
('53', '1', '34', '
'),
('53', '1', '35', '
   You can chain as many commands together as you like. Say you have an
   inexplicable desire to replace every G with Q. For this you use the
   command tr G Q, like this:
'),
('53', '1', '36', '
'),
('53', '6', '37', '
   tac /usr/doc/copyright/GPL | tr G Q | less
'),
('53', '1', '38', '
'),
('53', '4', '39', '
   You could get the same effect using temporary files and redirection, for
   example:
'),
('53', '1', '40', '
'),
('53', '6', '41', '
   tac /usr/doc/copyright/GPL > tmpfile

           tr G Q < tmpfile > tmpfile2

           less < tmpfile2

           rm tmpfile tmpfile2
'),
('53', '1', '42', '
'),
('53', '4', '43', '
   Clearly a pipeline is more convenient.
'),
('54', '1', '0', '
'),
('54', '1', '1', '
   Often you want a command to work with a group of files. Wildcards are
   used to create a filename expansion pattern: a series of characters
   and wildcards that expands to a list of filenames. For example, the pattern
   /etc/* expands to a list of all[2]
   the files in /etc.
'),
('54', '1', '2', '
'),
('54', '3', '3', '
 [2]
Actually, files beginning with . are not included in the expansion of *.
'),
('54', '1', '4', '
'),
('54', '1', '5', '
   * is a wildcard that can stand for any series of characters, so the
   pattern /etc/* will expand to a list of all the filenames beginning with
   /etc/.
'),
('54', '1', '6', '
'),
('54', '1', '7', '
   This filename list is most useful as a set of arguments for a command. For
   example, the /etc directory contains a series of subdirectories called
   rc0.d, rc1.d, etc. Normally to view the contents of these, you would type
   the following:
'),
('54', '1', '8', '
'),
('54', '6', '9', '
   ls /etc/rc0.d /etc/rc1.d /etc/rc2.d /etc/rc3.d

   ls /etc/rc4.d /etc/rc5.d /etc/rc6.d /etc/rcS.d
'),
('54', '1', '10', '
'),
('54', '1', '11', '
   This is tedious. Instead, you can use the ? wildcard as shown here:
'),
('54', '1', '12', '
'),
('54', '6', '13', '
   ls /etc/rc?.d
'),
('54', '1', '14', '
'),
('54', '4', '15', '
   /etc/rc?.d expands to a list of filenames that begin with rc, followed by
   any single character, followed by .d.
'),
('54', '1', '16', '
'),
('54', '1', '17', '
   Available wildcards include the following:
'),
('54', '1', '18', '
'),
('54', '1', '19', '
* Matches any group of 0 or more characters.
'),
('54', '1', '20', '
'),
('54', '1', '21', '
? Matches exactly one character.
'),
('54', '1', '22', '
'),
('54', '1', '23', '
[...] If you enclose some characters in brackets, the result is a
   wildcard that matches those characters. For example, [abc] matches either a,
   or b, or c. If you add a ^ after the first bracket, the sense is reversed;
   so [^abc] matches any character that is not a, b, or c. You can include a
   range, such as [a-j], which matches anything between a and j. The match is
   case sensitive, so to allow any letter, you must use [a-zA-Z].
'),
('54', '1', '24', '
'),
('54', '1', '25', '
   Expansion patterns are simple once you see some concrete examples:
'),
('54', '1', '26', '
'),
('54', '1', '27', '
*.txt This will give you a list of all filenames that end in .txt,
   since the * matches anything at all.
'),
('54', '1', '28', '
'),
('54', '1', '29', '
*.[hc] This gives a list of filenames that end in either .h or .c.
'),
('54', '1', '30', '
'),
('54', '1', '31', '
a?? This gives you all three-letter filenames that begin with a.
'),
('54', '1', '32', '
'),
('54', '1', '33', '
[^a]?? This gives you all three-letter filenames that do not begin
   with a.
'),
('54', '1', '34', '
'),
('54', '1', '35', '
a* This gives you every filename that starts with a, regardless of
   how many letters it has.
'),
('55', '1', '0', '
'),
('55', '1', '1', '
   In section 5.2 on page [*], we covered moving and renaming files with mv,
   copying them with cp, removing them with rm, removing directories with
   rmdir, and creating directories with mkdir. This chapter will cover some
   more aspects of working with files.
'),
('56', '1', '0', '
'),
('56', '1', '1', '
   GNU and Unix systems are set up to allow many people to use the same
   computer, while keeping certain files private or keeping certain people
   from modifying certain files. You can verify this for yourself. Log in as
   yourself, i.e. NOT as root.
'),
('56', '1', '2', '
'),
('56', '6', '3', '
   whoami
'),
('56', '1', '4', '
'),
('56', '4', '5', '
   This verifies that you are not root. Then enter the following command:
'),
('56', '1', '6', '
'),
('56', '6', '7', '
   rm /etc/resolv.conf
'),
('56', '1', '8', '
'),
('56', '4', '9', '
   You should be told Permission denied. /etc/resolv.conf is an essential
   system configuration file; you aren’t allowed to change or remove it
   unless you’re root. This keeps you from accidentally messing up the
   system, and if the computer is a public one (such as at an office or
   school), it keeps users from messing up the system on purpose.
'),
('56', '1', '10', '
'),
('56', '1', '11', '
   Now type ls -l /etc/resolv.conf.
'),
('56', '1', '12', '
'),
('56', '1', '13', '
   This will give you output that looks something like this:
'),
('56', '1', '14', '
'),
('56', '6', '15', '
   -rw-r-r- 1 root root 119 Feb 23 1997 /etc/resolv.conf
'),
('56', '1', '16', '
'),
('56', '4', '17', '
   The -l option to ls requests all that additional information. The info on
   the right is easy: The size of the file is 119 bytes; the date the file
   was last changed is February 23, 1997; and the file’s name is
   /etc/resolv.conf. On the left side of the screen, things are a little more
   complicated.
'),
('56', '1', '18', '
'),
('56', '1', '19', '
   First, the brief, technical explanation: The -rw-r-r- is the mode of
   the file, the 1 is the number of hard links to this file (or the number of
   files in a directory), and the two roots are the user and group owning the
   file, respectively.
'),
('56', '1', '20', '
'),
('56', '1', '21', '
   So that was cryptic. Let’s go through it slowly.
'),
('56', '1', '22', '
'),
('56', '7', '23', '
7.1.1 File Ownership
'),
('56', '1', '24', '
'),
('56', '1', '25', '
   Every file has two owners: a user and a group. The above case is a little
   confusing because there’s a group called root in addition to the root
   user. Groups are just collections of users who are collectively permitted
   access to some part of the system. A good example is a games group. Just
   to be mean, you might create a group called games on your computer and
   then set up your system so that only people in a games group are allowed
   to play games.
'),
('56', '1', '26', '
'),
('56', '1', '27', '
   Here’s a more practical example. Consider a case in which you’re setting
   up a computer for a school. You might want certain files to be accessible
   only to teachers, not students, so you put all the teachers in a single
   group. Then you can tell the system that certain files belong to members
   of the group teachers, and that no one else can access those files.
'),
('56', '1', '28', '
'),
('56', '1', '29', '
   Let’s explore groups on the system. First, you can use the groups command
   at the shell prompt. This will show you a list of the groups to which you
   belong. Here’s an example:
'),
('56', '1', '30', '
'),
('56', '6', '31', '
   $ groups

   system-wide configuration!permissions!file

   ownershipusername dialout cdrom floppy audio
'),
('56', '1', '32', '
'),
('56', '4', '33', '
   It’s likely that you’re a member of only one group, which is identical to
   your username. However, root can add you to other groups. The above
   example shows a person that is a member of five groups.
'),
('56', '1', '34', '
'),
('56', '6', '35', '
   less /etc/group
'),
('56', '1', '36', '
'),
('56', '4', '37', '
   This file lists the groups that exist on your system. Notice the root
   group (the only member of this group is the root user), and the group that
   corresponds to your username. There are also groups like dialout (users
   who are allowed to dial out on the modem) and floppy (users who can use
   the floppy drive). However, your system is probably not configured to make
   use of these groups. It’s likely that only root can use the floppy or the
   modem right now. For details about this file, try reading man group.
'),
('56', '1', '38', '
'),
('56', '6', '39', '
   ls -l /home
'),
('56', '1', '40', '
'),
('56', '4', '41', '
   This command shows you that every user’s directory is owned by that user
   and that user’s personal group.
'),
('56', '1', '42', '
'),
('56', '2', '43', '
     Tip: If you just installed Debian, you may be the only user. You can use
     the adduser command to add more users to the system.
'),
('56', '1', '44', '
'),
('56', '7', '45', '
7.1.2 Mode
'),
('56', '1', '46', '
'),
('56', '1', '47', '
   In addition to being owned by one user and one group, every file and
   directory also has a mode, which determines who’s allowed to read, write,
   and execute the file (and run it, if it’s a program). There are a few
   other things also determined by the mode, but they’re advanced topics so
   we’ll skip them for now.
'),
('56', '1', '48', '
'),
('56', '1', '49', '
   The mode looks like this in the ls output: -rw-r-r-. For now, we’ll
   consider nine of these parts: those that control read, write, and
   execute permissions for the user owning the file, the
   group owning the file, and others (everyone on the system,
   sometimes called world).
'),
('56', '1', '50', '
'),
('56', '1', '51', '
   In the mode line, the first “element” gives the file type. The - in this
   case means it’s a regular file. If it was d, we’d be looking at a
   directory. There are also other possibilities too complex to go into here;
   for details, see section 13.2.2 on page [*].
'),
('56', '1', '52', '
'),
('56', '1', '53', '
   The remaining nine elements are used to display the file’s mode. The basic
   9 bits (read, write, and execute for user, group, and other) are displayed
   as three blocks of rwx.
'),
('56', '1', '54', '
'),
('56', '1', '55', '
   So if all permissions are turned on and this is a regular file, the mode
   will look like this: -rwxrwxrwx. If it was a directory with all
   permissions turned off for others and full permissions for user and group,
   it would be drwxrwx--.
'),
('56', '1', '56', '
'),
('56', '5', '57', '			Table 7.1: Permissions in Linux
+------------------------------------------------------------------------------+
| Code |  Name   | Allows for Files         | Allows for Directories           |
|------+---------+--------------------------+----------------------------------|
|  r   |  read   | Examine contents of file | List contents of directory       |
|------+---------+--------------------------+----------------------------------|
|  w   |  write  | Modify file              | Add or remove files in directory |
|------+---------+--------------------------+----------------------------------|
|  x   | execute | Run as a command         | Access files in directory        |
+------------------------------------------------------------------------------+
'),
('56', '1', '58', '
'),
('56', '1', '59', '
   Table 7.1 describes the meaning of the read, write, and execute
   permissions for both files and directories.
'),
('56', '1', '60', '
'),
('56', '1', '61', '
   Directory modes can be a little confusing, so here are some examples of
   the effects of various combinations:
'),
('56', '1', '62', '
'),
('56', '6', '63', '
   r-
'),
('56', '1', '64', '
'),
('56', '4', '65', '
   The user, group, or other with these permissions may list the contents of
   the directory, but can do nothing else. The files in the directory can’t
   be read, changed, deleted, or manipulated in any way. The only permitted
   action is reading the directory itself, that is, seeing what files it
   contains.
'),
('56', '1', '66', '
'),
('56', '6', '67', '
   rw-
'),
('56', '1', '68', '
'),
('56', '4', '69', '
   Write permission has no effect in the absence of execute permission, so
   this mode behaves just like the above mode.
'),
('56', '1', '70', '
'),
('56', '6', '71', '
   r-x
'),
('56', '1', '72', '
'),
('56', '4', '73', '
   This mode permits the files in a directory to be listed and permits access
   to those files. However, files can’t be created or deleted. Access means
   that you can view, change, or execute the files as permitted by the files’
   own permissions.
'),
('56', '1', '74', '
'),
('56', '6', '75', '
   -x
'),
('56', '1', '76', '
'),
('56', '4', '77', '
   Files in this directory can be accessed, but the contents of the directory
   can’t be listed, so you have to know what filename you’re looking for in
   advance (unless you’re exceptionally good at guessing). Files can’t be
   created or deleted.
'),
('56', '1', '78', '
'),
('56', '6', '79', '
   rwx
'),
('56', '1', '80', '
'),
('56', '4', '81', '
   You can do anything you want with the files in this directory, as long as
   it’s permitted by the permissions on the files themselves.
'),
('56', '1', '82', '
'),
('56', '1', '83', '
   Directory write permission determines whether you can delete files in a
   directory. A read-only file can be deleted if you have permission to write
   to the directory containing it. You can’t delete a file from a read-only
   directory even if you’re allowed to make changes to the file.
'),
('56', '1', '84', '
'),
('56', '1', '85', '
   This also means that if you own a directory you can always delete files
   from it, even if those files belong to root.
'),
('56', '1', '86', '
'),
('56', '1', '87', '
   Directory execute permission determines whether you have access to files -
   and thus whether file permissions come into play. If you have execute
   permissions to a directory, file permissions for that directory become
   relevant. Otherwise, file permissions just don’t matter; you can’t access
   the files anyway.
'),
('56', '1', '88', '
'),
('56', '7', '89', '
7.1.3 Permissions in Practice
'),
('56', '1', '90', '
'),
('56', '1', '91', '
   This section goes through a short example session to demonstrate how
   permissions are used. To change permissions, we’ll use the chmod command.
'),
('56', '1', '92', '
'),
('56', '6', '93', '
   cd; touch myfile
'),
('56', '1', '94', '
'),
('56', '4', '95', '
   There are a couple of new tricks here. First, you can use ; to put two
   commands on one line. You can type the above as:
'),
('56', '1', '96', '
'),
('56', '6', '97', '
   $ cd

   $ touch myfile
'),
('56', '1', '98', '
'),
('56', '1', '99', '
   or as:
'),
('56', '1', '100', '
'),
('56', '6', '101', '
   $ cd; touch myfile
'),
('56', '1', '102', '
'),
('56', '4', '103', '
   Either way the same thing will end up happening.
'),
('56', '1', '104', '
'),
('56', '1', '105', '
   Recall that cd by itself returns you to your home directory. touch is
   normally used to change the modification time of the file to the current
   time. But it has another interesting feature: If the file doesn’t exist,
   touch creates the file. So you’re using it to create a file to practice
   with. Use ls -l to confirm that the file has been created and notice the
   permissions mode:
'),
('56', '1', '106', '
'),
('56', '6', '107', '
   $ ls -l

'),
('56', '1', '108', '
'),
('56', '4', '109', '
   -rw-r-r- 1 user user 0 Nov 18 22:04 myfile
'),
('56', '1', '110', '
'),
('56', '1', '111', '
   Obviously the time and user/group names will be different when you try it.
   The size of the file is 0, because touch creates an empty file. -rw-r-r-
   is the default permissions mode on Debian.
'),
('56', '1', '112', '
'),
('56', '6', '113', '
   chmod u+x myfile
'),
('56', '1', '114', '
'),
('56', '4', '115', '
   This command means to add (+) execute (x) permissions for the user (u) who
   owns the file. Use ls -l to see the effects.
'),
('56', '1', '116', '
'),
('56', '6', '117', '
   chmod go-r myfile
'),
('56', '1', '118', '
'),
('56', '4', '119', '
   Here you’ve subtracted (-) read permission (r) from the group (g) owning
   the file and from everyone else (others, o). Again, use ls -l to verify
   the effects.
'),
('56', '1', '120', '
'),
('56', '6', '121', '
   chmod ugo=rx myfile
'),
('56', '1', '122', '
'),
('56', '4', '123', '
   Here you’ve set (=) user, group, and other permissions to read and
   execute. This sets permissions to exactly what you’ve specified
   and unsets any other permissions. So all rx should be set, and all w should
   be unset. Now, no one can write to the file.
'),
('56', '1', '124', '
'),
('56', '6', '125', '
   chmod a-x myfile
'),
('56', '1', '126', '
'),
('56', '4', '127', '
   a is a shortcut for ugo, or “all.” So all the x permissions should now
   be unset.
'),
('56', '1', '128', '
'),
('56', '6', '129', '
   rm myfile
'),
('56', '1', '130', '
'),
('56', '4', '131', '
   With this command, you’re removing the file, but without write
   permissions. rm will ask if you’re sure by displaying the following
   message:
'),
('56', '1', '132', '
'),
('56', '6', '133', '
   rm: remove ‘myfile’, overriding mode 0444?
'),
('56', '1', '134', '
'),
('56', '4', '135', '
   You should respond by typing y and pressing Enter. This is a feature of
   rm, not a fact of permissions. Permission to delete a file comes from the
   directory permissions, and you have write permission in the directory.
   However, rm tries to be helpful, figuring that if you didn’t want to
   change the file (and thus remove write permission), you don’t want to
   delete it either, so it asks you.
'),
('56', '1', '136', '
'),
('56', '1', '137', '
   What was that 0444 business in the question from rm? The permissions mode
   is a twelve-digit binary number, like this: 000100100100. 0444 is this
   binary number represented as an octal (base 8) number, which is the
   conventional way to write a mode. So you can type chmod 444 myfile instead
   of chmod ugo=r myfile.
'),
('57', '1', '0', '
'),
('57', '1', '1', '
   Now that you can navigate the directory tree, let’s take a guided tour of
   the files and directories you created when you installed Debian. If you’re
   curious, cd to each directory and type ls to see its contents. If the
   listing doesn’t fit on the screen, try ls | less, where | is the “pipe”
   character, generally found on the same key with backslash.
'),
('57', '1', '2', '
'),
('57', '1', '3', '
   / As already mentioned, this is the root directory, which contains every
   other directory.
'),
('57', '1', '4', '
'),
('57', '1', '5', '
   /root
           But don’t get /confused with /root! /root is the home directory of
           the root user, or superuser. It’s a directory called /root, but it
           isn’t the root directory /.
'),
('57', '1', '6', '
'),
('57', '1', '7', '
   /home This is where all normal users—that is, all users except
   root—have their home directories. Each home directory is named after
   the user who owns it, for example, /home/jane. If you’re using a large
   system at a school or business, your system administrator may create
   additional directories to contain home directories: /home1 and /home2 for
   example. On some other systems, you’ll see an additional level of
   subdirectories: /home/students/username, /home/staff/username, etc.
'),
('57', '1', '8', '
'),
('57', '1', '9', '
           Your home directory is where you put all your personal work,
           e-mail and other documents, and personal configuration
           preferences. It’s your home on the system.
'),
('57', '1', '10', '
'),
('57', '1', '11', '
   /bin
           This directory contains “binaries,” executable files that are
           essential to the operation of the system. Examples are the shell
           (bash) and file commands such as cp.
'),
('57', '1', '12', '
'),
('57', '1', '13', '
   /sbin
           This directory contains “system binaries,” utilities that the
           root user or system administrator might want to use, but that you
           probably won’t want to use in your day-to-day activities.
'),
('57', '1', '14', '
'),
('57', '1', '15', '
   /usr
           /usr contains most of the files you’ll be interested in. It has
           many subdirectories. /usr/bin and /usr/sbin are pretty much like
           /bin and /sbin, except that the directories in /usr are not
           considered “essential to the operation of the system.”
'),
('57', '1', '16', '
'),
('57', '1', '17', '
           While not essential to getting the computer working, /usr does
           contain the applications you’ll use to get real work done. Also in
           /usr, you’ll find the /usr/man, /usr/info, and /usr/doc
           directories. These contain manual pages, info pages, and other
           documentation, respectively. And don’t forget /usr/games!
'),
('57', '1', '18', '
'),
('57', '1', '19', '
   /usr/local
           The Debian system doesn’t install anything in this directory. You
           should use it if you want to install software that you compile
           yourself or any software not contained in a Debian package. You
           can also install software in your home directory if you’ll be the
           only one using it.
'),
('57', '1', '20', '
'),
('57', '1', '21', '
   /etc
           /etc contains all the system-wide configuration files. Whenever
           you want to change something that affects all users of your
           computer—such as how you connect to the Internet or what kind of
           video card you have—you’ll probably have to log on as root and
           change a file in /etc.
'),
('57', '1', '22', '
'),
('57', '1', '23', '
   /tmp
           Here you’ll find temporary files, most of them created by the
           system. This directory is generally erased on a regular basis or
           every time you reboot the system. You can create files here if you
           want, just be aware that they might get deleted automatically.
'),
('57', '1', '24', '
'),
('57', '1', '25', '
   /var
           /var contains “variable” files that the system changes
           automatically. For example, incoming mail is stored here. The
           system keeps a log of its actions here. There are a number of
           other automatically generated files here as well. You’ll mostly be
           interested in the contents of /var/log, where you can find error
           messages that can help you figure out what you’re system’s up to
           if something goes wrong.
'),
('57', '1', '26', '
'),
('57', '4', '27', '
   Clearly there are many more directories on the system—far too many to
   describe every one.
'),
('57', '1', '28', '
'),
('57', '1', '29', '
   For changing things, you’ll usually want to confine yourself to your home
   directory and /etc. On a Debian system, there’s rarely an occasion to
   change anything else, because everything else is automatically installed
   for you.
'),
('57', '1', '30', '
'),
('57', '1', '31', '
   /etc is used to configure the system as a whole. You’ll use your own home
   directory, a subdirectory of /home, for configuring your own preferences
   and storing your personal data. The idea is that on a day-to-day basis,
   you confine yourself to /home/yourname, so there’s no way you can break
   anything. Occasionally you log in as root to change something in a
   system-wide directory, but only when it’s absolutely necessary. Of course,
   if you’re using Debian at a school or business and someone else is the
   system administrator, you won’t have root access and will be able to
   change only your home directory and any other directory that you own. This
   limits what you can do with the system.
'),
('58', '1', '0', '
'),
('58', '1', '1', '
   Often it would be nice to make a file smaller—say, to download it
   faster, or so it takes up less space on your disk. The program to do this
   is called gzip (GNU zip). Here’s how it works:
'),
('58', '1', '2', '
'),
('58', '6', '3', '
   $ cd; cp /etc/profile ./mysamplefile
'),
('58', '1', '4', '
'),
('58', '4', '5', '
   This switches to your home directory and copies an arbitrarily chosen file
   (/etc/profile) to your current directory, in the process renaming it
   mysamplefile. This gives you a file to play with when using gzip.
'),
('58', '1', '6', '
'),
('58', '6', '7', '
   $ ls -l
'),
('58', '1', '8', '
'),
('58', '4', '9', '
   Lists the contents of the current directory. Note the size of
   mysamplefile.
'),
('58', '1', '10', '
'),
('58', '6', '11', '
   $ gzip mysamplefile
'),
('58', '1', '12', '
'),
('58', '4', '13', '
   Compresses mysamplefile.
'),
('58', '1', '14', '
'),
('58', '6', '15', '
   $ ls -l
'),
('58', '1', '16', '
'),
('58', '4', '17', '
   Observe the results of this command: mysamplefile is now called
   mysamplefile.gz . It’s also a good bit smaller.
'),
('58', '1', '18', '
'),
('58', '6', '19', '
   $ gunzip mysamplefile.gz; ls -l
'),
('58', '1', '20', '
'),
('58', '4', '21', '
   This uncompresses the file. Observe that mysamplefile has returned to its
   original state. Notice that to uncompress, one uses gunzip, not gzip.
'),
('58', '1', '22', '
'),
('58', '6', '23', '
   $ rm mysamplefile
'),
('58', '1', '24', '
'),
('58', '4', '25', '
   Use this command to remove the file, since it was just to practice with.
'),
('59', '1', '0', '
'),
('59', '1', '1', '
   There are two different facilities for finding files: find and locate.
   find searches the actual files in their present state. locate searches an
   index generated by the system every morning at 6:42 a.m. (this is a cron
   job, explained elsewhere in this book). locate won’t find any files that
   were created after the index was generated. However, because locate
   searches an index, it’s much faster—like using the index of a book
   rather than looking through the whole thing.
'),
('59', '1', '2', '
'),
('59', '1', '3', '
   To compare the two ways of finding files, pretend you can’t remember where
   the X configuration file XF86Config resides.
'),
('59', '1', '4', '
'),
('59', '6', '5', '
   $ locate XF86Config
'),
('59', '1', '6', '
'),
('59', '4', '7', '
   This should be pretty fast. You’ll get a list of filenames that contain
   XF86Config, something like this:
'),
('59', '1', '8', '
'),
('59', '6', '9', '
   /etc/X11/XF86Config

   /usr/X11R6/lib/X11/XF86Config

   /usr/X11R6/lib/X11/XF86Config.eg

   /usr/X11R6/man/man5/XF86Config.5x.gz
'),
('59', '1', '10', '
'),
('59', '4', '11', '
   Now try the find command:
'),
('59', '1', '12', '
'),
('59', '6', '13', '
   $ find / -name XF86Config
'),
('59', '1', '14', '
'),
('59', '4', '15', '
   You will hear a lot of disk activity, and this will take a lot longer.
   Results will look something like this:
'),
('59', '1', '16', '
'),
('59', '6', '17', '
   /etc/X11/XF86Config

   /usr/X11R6/lib/X11/XF86Config

   find: /var/spool/cron/atjobs: Permission denied

   find: /var/spool/cron/atspool: Permission denied

   find: /var/lib/xdm/authdir: Permission denied
'),
('59', '1', '18', '
'),
('59', '4', '19', '
   Notice that find found only files that were named exactly XF86Config,
   rather than any files containing that string of letters. Also, find actually
   tried to look in every directory on the system—including some where
   you didn’t have read permissions. That’s why you got the
   Permission denied messages.
'),
('59', '1', '20', '
'),
('59', '1', '21', '
   The syntax is different as well. With find, you had to specify what
   directory to search in, whereas locate automatically chose the root
   directory. And you had to specify a search by name using the -name option.
   You could also have searched for files using many other criteria, such as
   modification date or owner. To have find search for files whose names
   match XF86Config, you’d have to use a wildcard:
'),
('59', '1', '22', '
'),
('59', '6', '23', '
   $ find / -name ’*XF86Config*’
'),
('59', '1', '24', '
'),
('59', '4', '25', '
   Like most of the command line tools, find accepts wildcards as arguments.
'),
('59', '1', '26', '
'),
('59', '1', '27', '
   In general, find is a more powerful utility, and locate is faster for
   everyday quick searches. The full range of possible searches would take a
   long time to explain; for more details , type info find, which will bring
   up the very thorough info pages on find and locate.
'),
('60', '1', '0', '
'),
('60', '1', '1', '
   Debian comes with a utility that can guess at the contents of a file for
   you. Although it is not 100% accurate, you can use the following command
   to explore your system:
'),
('60', '1', '2', '
'),
('60', '6', '3', '
   $ file /bin/cp
'),
('60', '1', '4', '
'),
('60', '4', '5', '
   You should see something like this:
'),
('60', '1', '6', '
'),
('60', '6', '7', '
   /bin/cp: ELF 32-bit LSB executable, Intel 386, version 1
'),
('60', '1', '8', '
'),
('60', '4', '9', '
   Skipping the technical parts, this is an executable file for Intel
   machines.
'),
('60', '1', '10', '
'),
('60', '6', '11', '
   $ file /etc/init.d/boot
'),
('60', '1', '12', '
'),
('60', '4', '13', '
   The preceding command gives this response:
'),
('60', '1', '14', '
'),
('60', '6', '15', '
   /etc/init.d/boot: Bourne shell script text
'),
('60', '1', '16', '
'),
('60', '4', '17', '
   meaning that this is a text file containing a Bourne shell script.
'),
('61', '1', '0', '
'),
('61', '1', '1', '
   Instead of moving files around by hand, you can use a file manager.
   If you move a lot of files around, a file manager can make your work more
   efficient. There are text-based file managers, such as GNU Midnight
   Commander (mc), and a number of file managers for the X Window system (for
   example gmc for the X Window version of GNU Midnight Commander).
'),
('61', '1', '2', '
'),
('61', '1', '3', '
   Describing each of these is outside the scope of this book, but you may
   want to try them out if the command line doesn’t meet your needs.
'),
('62', '1', '0', '
'),
('62', '1', '1', '
   Text files are prevelant on a GNU/Linux system. They hold everything from
   documentation to configuration files. Fortunately, it’s easy to work with
   them.
'),
('63', '1', '0', '
'),
('63', '1', '1', '
   A text file is simply a normal file that happens to contain
   human-readable text. There’s nothing special about it otherwise. The
   other kind of file, a binary file, is meant to be interpreted by the
   computer.
'),
('63', '1', '2', '
'),
('63', '1', '3', '
   You can view either kind of file with the less file pager if you have it
   installed (install it if you haven’t, it’s quite useful). Type less
   /etc/profile to view a sample text file. Notice that you can read the
   characters even if their meaning is obscure. Type less /bin/ls to view a
   binary file. As you can see, the ls program is not meant to be read by
   humans.
'),
('63', '1', '4', '
'),
('63', '1', '5', '
   Sometimes, you’ll find files that end with .gz. These files may be viewed
   with zless; you can run it like so:
'),
('63', '1', '6', '
'),
('63', '6', '7', '
   zless /usr/doc/ae/changelog.Debian.gz
'),
('63', '1', '8', '
'),
('63', '2', '9', '
   Tip: zless is great for viewing documentation, which is often shipped in .gz
   form.
'),
('63', '1', '10', '
'),
('63', '1', '11', '
   The difference between the two kinds of files is purely a matter of what
   they contain, unlike in some other systems (such as DOS and MacOS), which
   actually treat the files differently.
'),
('63', '1', '12', '
'),
('63', '1', '13', '
   Text files can contain shell scripts, documentation, copyright notices, or
   any other human-readable text.
'),
('63', '1', '14', '
'),
('63', '1', '15', '
   Incidentally, this illustrates the difference between source code and
   binary executables. /bin/ls is a binary executable you can download
   from Debian, but you can also download a text file that tells the computer
   how to create /bin/ls. This text file is the source code. Comparing /bin/ls
   to /etc/profile illustrates how important source code is if someone wants to
   understand and modify a piece of software. Free software provides you or
   your consultants with this all-important source code.
'),
('64', '1', '0', '
'),
('64', '1', '1', '
   A text editor is a program used to create and change the contents of
   text files. Most operating systems have a text editor: DOS has edit, Windows
   has Notepad, MacOS has SimpleText.
'),
('64', '1', '2', '
'),
('64', '1', '3', '
   Debian provides a large variety of text editors. vi and Emacs are the
   classic two, which are probably both the most powerful and the most widely
   used. Both vi and Emacs are quite complex and require some practice, but
   they can make editing text extremely efficient. Emacs runs both in a
   terminal and under the X Window system; vi normally runs in a terminal but
   the vim variant has a -g option that allows it to work with X. text
   editors
'),
('64', '1', '4', '
'),
('64', '1', '5', '
   Simpler editors include nedit, ae, jed, and xcoral. nedit and xcoral
   provide easy-to-use X Window system graphical interfaces. There are also
   several vi variants. Additionally, you can find and a GNU Emacs variant
   called XEmacs.
'),
('64', '1', '6', '
'),
('64', '1', '7', '
   This book does not cover the use of any particular editor in detail,
   though we will briefly introduce ae since it is small, fast, and can be
   found even on the Debian rescue disks, so it pays to know a bit about it
   for usage in a pinch. When you need to do more serious editing, check out
   vim or GNU Emacs. Emacs provides an excellent interactive tutorial of its
   own; to read it, load Emacs with the emacs command and type F1 t. Emacs is
   an excellent choice for new users interested in a general-purpose or
   programming editor.
'),
('65', '1', '0', '
'),
('65', '1', '1', '
   You can start ae by giving it the name of a file to edit, like so:
'),
('65', '1', '2', '
'),
('65', '6', '3', '
   $ ae filename.txt
'),
('65', '1', '4', '
'),
('65', '4', '5', '
   This will bring up an editor screen. The top part of this screen provides
   some quick help; the bottom shows the file you’re editing. Moving around
   in this editor is simple; just use the arrow keys. You can save the file
   by pressing C-x C-s and then exit the editor by pressing C-x C-c. Once you
   feel comfortable with the editor, you can press C-x C-h to turn off the
   help. That’s it! Knowing this will let you do basic editing. For
   programming or more detailed editing work, you’ll want to investigate
   other editors as discussed earlier.
'),
('66', '1', '0', '
'),
('66', '1', '1', '
   This chapter describes the X Window system graphical user interface. It
   assumes that you have already successfully configured X as described in
   the Installation Manual (again, the install manual is not yet written; for
   now you will need to use the XFree86 HOWTO, the contents of /usr/doc/X11,
   and this chapter). Once you install X, you can enter the X environment by
   typing startx or via xdm, depending on your choice during configuration.
'),
('67', '1', '0', '
'),
('67', '1', '1', '
   A GUI (Graphical User Interface) is part and parcel of the Windows and Mac
   operating systems. It’s basically impossible to write an application for
   those systems that does not use the GUI, and the systems can’t be used
   effectively from the command line. GNU/Linux is more modular, that is,
   it’s made up of many small, independent components that can be used or not
   according to one’s needs and preferences. One of these components is the X
   Window system, or simply X.
'),
('67', '1', '2', '
'),
('67', '1', '3', '
   This component is also sometimes called X11. Please note that “X
   Windows” is not correct.
'),
('67', '1', '4', '
'),
('67', '1', '5', '
   X itself is a means for programs to talk to your mouse and video card
   without knowing what kind of mouse and video card you have. That is, it’s
   an abstraction of the graphics hardware. User applications talk to X in
   X’s language; X then translates into the language of your particular
   hardware. This means that programs only have to be written once, and they
   work on everyone’s computer.
'),
('67', '1', '6', '
'),
('67', '1', '7', '
   In X jargon, the program that speaks to the hardware is known as an X
   server. User applications that ask the X server to show windows or
   graphics on the screen are called X clients. The X server includes a video
   driver, so you must have an X server that matches your video card.
'),
('67', '1', '8', '
'),
('67', '1', '9', '
   The X server doesn’t provide any of the features one might expect from a
   GUI, such as resizing and rearranging windows. A special X client, called
   a window manager, draws borders and title bars for windows, resizes and
   arranges windows, and provides facilities for starting other X clients
   from a menu. Specific window managers may have additional features.
'),
('67', '1', '10', '
'),
('67', '1', '11', '
   Window managers available on a Debian system include fvwm, fvwm2, icewm,
   afterstep, olvwm, wmaker, twm, and enlightenment. You’ll probably want to
   try them all and pick your favorite.
'),
('67', '1', '12', '
'),
('67', '1', '13', '
   Neither the X server nor the window manager provide a file manager; that
   is, there aren’t any windows containing icons for your files and
   directories. You can launch a file manager as a separate application, and
   there are many of them available. The GNOME desktop project is developing
   an icon-based file manager and other GUI facilities. See the GNOME
   homepage[1] for the latest news on this.
'),
('67', '1', '14', '
'),
('67', '3', '15', '
 [1]
http://www.gnome.org/
'),
('67', '1', '16', '
'),
('67', '1', '17', '
   A final feature of X is its network transparency, meaning that X clients
   don’t care if they’re talking to an X server on the same machine or an X
   server somewhere on the network. In practical terms, this means you can
   run a program on a more powerful remote machine but display it on your
   desktop computer.
'),
('68', '1', '0', '
'),
('68', '1', '1', '
   There are two ways to start X. The first is to start X manually when you
   feel like using it. To do so, log in to one of the text consoles and type
   startx. This will start X and switch you to its virtual console.
'),
('68', '1', '2', '
'),
('68', '1', '3', '
   The second (and recommended) way to use X is with xdm or X Display
   Manager. Basically, xdm gives you a nice graphical login prompt on the X
   virtual console (probably VC 7), and you log in there.
'),
('68', '1', '4', '
'),
('68', '1', '5', '
   By default, either method will also start an xterm, which is a small
   window containing a shell prompt. At the shell prompt, you can type any
   commands just as you would on a text VC. So you can follow all the
   examples in this book using xterm; the only difference between an xterm
   and the text console is that you don’t have to log on to the xterm because
   you already logged on to X.
'),
('68', '1', '6', '
'),
('68', '1', '7', '
   There are also a lot of things you can do only in X, which are covered in
   this chapter.
'),
('68', '1', '8', '
'),
('68', '1', '9', '
   One note: The default xterm window has a smallish font. If you have a
   small monitor or very high resolution or bad eyesight, you may want to fix
   this. Follow these steps:
'),
('68', '1', '10', '
'),
('68', '2', '11', '
    1. Move the mouse pointer into the center of the xterm window.

    2. Hold down the Control key and the right mouse button
    simultaneously. This will give you a font menu.

    3. Point to the font you want and release the mouse button.
'),
('69', '1', '0', '
'),
('69', '1', '1', '
   There are certain commonly used operations in X that you should
   familiarize yourself with. This section describes some of the basic
   operations that you may find useful.
'),
('69', '1', '2', '
'),
('69', '7', '3', '
9.3.1 The Mouse
'),
('69', '1', '4', '
'),
('69', '1', '5', '
   The mouse in X works pretty much the same as the mouse on other systems,
   except that it has three buttons. If your mouse has only two, you can
   simulate the middle button by clicking both buttons simultaneously. This
   is kind of tricky and annoying, so investing in a $15 three-button mouse
   probably isn’t a bad idea. These are available from most computer
   retailers.
'),
('69', '1', '6', '
'),
('69', '1', '7', '
   The buttons are numbered from left to right assuming you have a
   right-handed mouse. So button one is on the left, two is in the middle,
   and three is on the right. You may see either the numbers or the locations
   in documentation.
'),
('69', '1', '8', '
'),
('69', '1', '9', '
   X has a simple built-in copy-and-paste facility. To select text to copy,
   you click and drag with the left mouse button. This should select the text
   to copy, assuming the application you’re using has copy-and-paste support.
   To paste the text, you click the middle mouse button in a different X
   application. For example, if you receive an e-mail containing an URL, you
   can select the URL with the left button and then click in your web
   browser’s “Location” field with the middle button to paste it in.
'),
('69', '1', '10', '
'),
('69', '7', '11', '
9.3.2 X Clients
'),
('69', '1', '12', '
'),
('69', '1', '13', '
   Programs that communicate with the X server are called X clients. Most of
   these programs will ask the X server to display windows on the screen.
'),
('69', '1', '14', '
'),
('69', '1', '15', '
   You start an X client the same way you start any other Debian program.
   Simply type the name of the client on the command line. Try typing xterm
   into an existing xterm window, and a new xterm client will appear on the
   screen.
'),
('69', '1', '16', '
'),
('69', '1', '17', '
   You may notice that the original xterm is now useless, because your shell
   is waiting for the second xterm to finish. To avoid this problem, you can
   run the X client in the backgroundby adding a & after the command name
   like this: xterm &. If you forget, you can place a running process in the
   background. First suspend the process with CTRL-z, and then place it in
   the background with the bg command.
'),
('69', '1', '18', '
'),
('69', '1', '19', '
   If you use a program often, your window manager will generally provide a
   way to put that program on a convenient graphical menu.
'),
('69', '1', '20', '
'),
('69', '7', '21', '
9.3.3 Troubleshooting
'),
('69', '1', '22', '
'),
('69', '1', '23', '
   Sometimes when you launch an X client from a graphical menu, you won’t be
   able to see any error messages if it fails. You can find any error
   messages in the file ~/.xsession-errors.
'),
('69', '1', '24', '
'),
('69', '7', '25', '
9.3.4 Leaving the X Environment
'),
('69', '1', '26', '
'),
('69', '1', '27', '
   To leave X, you need to use a menu. Unfortunately for beginners, this is
   different for every window manager, and for most window managers, it can
   be configured in many ways. If there’s an obvious menu, look for an entry
   like “Exit” or “Close Window Manager.” If you don’t see a menu, try
   clicking each of the mouse buttons on the background of the screen. If all
   else fails, you can forcibly kill the X server by pressing
   CTRL-ALT-Backspace. Forcibly killing the server destroys any unsaved data
   in open applications.
'),
('70', '1', '0', '
'),
('70', '1', '1', '
   When you start X, Debian runs some shell scripts that start your window
   manager and other X clients. By default, a window manager, an xconsole,
   and an xterm are started for you.
'),
('70', '1', '2', '
'),
('70', '1', '3', '
   To customize your X startup, the file /etc/X11/config must contain the
   line allow-user-xsession. If it does not, log in as root and add the line
   now. Then log back in as yourself and continue the tutorial.
'),
('70', '1', '4', '
'),
('70', '1', '5', '
   You can see how Debian’s X startup works in the file /etc/X11/ Xsession.
   Note that you can change the behavior of /etc/X11/Xsession by modifying
   the file /etc/X11/config, which specifies a few system-wide preferences.
'),
('70', '1', '6', '
'),
('70', '1', '7', '
   To run the clients of your choice when X starts, you create an executable
   shell script called .xsession in your home directory.
'),
('70', '1', '8', '
'),
('70', '6', '9', '
   $ touch ~/.xsession
'),
('70', '1', '10', '
'),
('70', '4', '11', '
   This creates the file.
'),
('70', '1', '12', '
'),
('70', '6', '13', '
   $ chmod u+x ~/.xsession
'),
('70', '1', '14', '
'),
('70', '4', '15', '
   This makes the file executable.
'),
('70', '1', '16', '
'),
('70', '1', '17', '
   Once .xsession is created, you need to edit it to do something useful with
   your favorite text editor. You can do anything you want to in this script.
   However, when the script’s process terminates, X also terminates.
'),
('70', '1', '18', '
'),
('70', '1', '19', '
   In practical terms, this means that you often end the script with a call
   to exec. Whatever program you exec will replace the script process with
   itself, so commands found after the exec line will be ignored. The program
   you exec will become the new owner of the script process, which means that
   X will terminate when this new program’s process terminates.
'),
('70', '1', '20', '
'),
('70', '1', '21', '
   Say you end your .xsession with the line exec fvwm. This means that the
   fvwm window manager will be run when X starts. When you quit the fvwm
   window manager, your X session will end, and all other clients will be
   shut down. You do not have to use a window manager here; you could exec
   xterm, in which case typing exit in that particular xterm would cause the
   entire X session to end.
'),
('70', '1', '22', '
'),
('70', '1', '23', '
   If you want to run other clients before you use exec, you will need to run
   them in the background. Otherwise .xsession will pause until each client
   exits and then continue to the next line. See the previous section on
   running jobs in the background (basically you want to put an ampersand at
   the end, as in xterm &).
'),
('70', '1', '24', '
'),
('70', '1', '25', '
   You can take advantage of this behavior, though. If you want to run
   commands at the end of your X session, you can have your .xsession run a
   window manager or the like and wait for it to finish. That is, leave off
   the exec and the &; just enter fvwm by itself. Then put the commands of
   your choice after fvwm.
'),
('70', '1', '26', '
'),
('70', '1', '27', '
   It would probably help to look at a few sample .xsession files. In all the
   examples, replace fvwm with the window manager of your choice.
'),
('70', '1', '28', '
'),
('70', '1', '29', '
   The simplest .xsession just runs a window manager:
'),
('70', '1', '30', '
'),
('70', '6', '31', '
   exec fvwm
'),
('70', '1', '32', '
'),
('70', '4', '33', '
   This will run fvwm, and the X session will end when fvwm exits. If you do
   it without the exec, everything will appear to behave the same way, but
   behind the scenes .xsession will hang around waiting for fvwm, and
   .xsession will exit after fvwm does. Using exec is slightly better because
   fvwm replaces .xsession instead of leaving it waiting. You can use the ps
   or top command to verify this.
'),
('70', '1', '34', '
'),
('70', '1', '35', '
   A more useful .xsession runs a few clients before starting the window
   manager. For example, you might want some xterms and an xclock whenever
   you start X. No problem; just enter xterm & xterm & xclock & exec fvwm.
   Two xterms and an xclock start up in the background, and then the window
   manager is launched. When you quit the window manager, you’ll also quit X.
'),
('70', '1', '36', '
'),
('70', '1', '37', '
   You might try it without the backgrounding just to see what happens. Enter
   this command: xterm xclock exec fvwm. xterm will start, and wait for you
   to exit it. Then xclock will start; you’ll have to exit xclock before fvwm
   will start. The commands are run in sequence, since the script waits for
   each one to exit.
'),
('70', '1', '38', '
'),
('70', '1', '39', '
   You can use sequential execution to your advantage. Perhaps you want to
   keep track of when you stop working every day:
'),
('70', '1', '40', '
'),
('70', '6', '41', '
   xterm &

   xclock &

   fvwm

   date >> ~/logout-time
'),
('70', '1', '42', '
'),
('70', '4', '43', '
   This will fork off an xterm and an xclock and then run fvwm and wait for
   it to finish. When you exit fvwm, it will move on to the last line, which
   appends the current date and time to the file ~/logout-time.
'),
('70', '1', '44', '
'),
('70', '1', '45', '
   Finally, you can have a program other than the window manager determine
   when X exits:
'),
('70', '1', '46', '
'),
('70', '6', '47', '
   xclock &

   fvwm &

   exec xterm
'),
('70', '1', '48', '
'),
('70', '4', '49', '
   This script will run xclock and fvwm in the background and then replace
   itself with xterm. When you exit the xterm, your X session will end.
'),
('70', '1', '50', '
'),
('70', '1', '51', '
   The best way to learn how to use .xsession is to try some of these things
   out. Again, be sure you use chmod to make it executable; failure to do so
   is a common error.
'),
('71', '1', '0', '
'),
('71', '1', '1', '
   A Debian system uses a filesystem to store and manage your data. This
   chapter introduces you to the filesystem, describes how to add and remove
   filesystems, and shows you how to back up your system.
'),
('72', '1', '0', '
'),
('72', '1', '1', '
   It’s probably a good idea to explain a little theory before discussing
   the mechanics of using disks. In particular, you must understand the concept
   of a filesystem. This can be a bit confusing because it has several
   meanings.
'),
('72', '1', '2', '
'),
('72', '1', '3', '
The filesystem refers to the whole directory tree, starting with the
   root directory /, as described in earlier chapters.
'),
('72', '1', '4', '
'),
('72', '1', '5', '
   A filesystem in general means any organization of files and directories on
   a particular physical device. “Organization” means the hierarchical
   directory structure and any other information about files one might want
   to keep track of: their size, who has permission to change them, etc. So
   you might have one filesystem on your hard disk, and another one on each
   floppy disk.
'),
('72', '1', '6', '
'),
('72', '1', '7', '
   “Filesystem” is also used to mean a type of filesystem.
   For example, MS-DOS and Windows 3.1 organize files in a particular way, with
   particular rules: Filenames can have only eight characters, for example, and
   no permission information is stored. Linux calls this the msdos filesystem.
   Linux also has its own filesystem, called the ext2 filesystem (version two
   of the ext filesystem). You’ll use the ext2 filesystem most of the
   time unless you’re accessing files from another operating system or
   have other special needs.
'),
('72', '1', '8', '
'),
('72', '1', '9', '
   Any physical device you wish to use for storing files must have at least
   one filesystem on it. This means a filesystem in the second sense—a
   hierarchy of files and directories, along with information about them. Of
   course, any filesystem has a type, so the third sense will come into play
   as well. If you have more than one filesystem on a single device, each
   filesystem can have a different type—for example, you might have both a
   DOS partition and a Linux partition on your hard disk.
'),
('73', '1', '0', '
'),
('73', '1', '1', '
   This section describes how to mount a floppy or Zip disk, discusses the
   /dev directory, and addresses distributing the directory tree over
   multiple physical devices or partitions.
'),
('73', '1', '2', '
'),
('73', '7', '3', '
10.2.1 Mounting a Filesystem
'),
('73', '1', '4', '
'),
('73', '1', '5', '
   On a GNU/Linux system there’s no necessary correspondence between
   directories and physical devices as there is in Windows, in which each
   drive has its own directory tree beginning with a letter (such as C:\).
'),
('73', '1', '6', '
'),
('73', '1', '7', '
   Instead, each physical device such as a hard disk or floppy disk has one
   or more filesystems on it. In order to make a filesystem accessible, it’s
   assigned to a particular directory in another filesystem. To avoid
   circularity, the root filesystem (which contains the root directory /) is
   not stored within any other filesystem. You have access to it
   automatically when you boot Debian.
'),
('73', '1', '8', '
'),
('73', '1', '9', '
   A directory in one filesystem that contains another filesystem is known as a
   mount point. A mount point is a directory in a first filesystem on
   one device (such as your hard disk) that “contains” a second
   filesystem, perhaps on another device (such as a floppy disk). To access a
   filesystem, you must mount it at some mount point.
'),
('73', '1', '10', '
'),
('73', '1', '11', '
   So, for example, you might mount a CD at the mount point /cdrom. This
   means that if you look in the directory /cdrom, you’ll see the contents of
   the CD. The /cdrom directory itself is actually on your hard disk. For all
   practical purposes, the contents of the CD become a part of the root
   filesystem, and when you type commands and use programs, it doesn’t make
   any difference what the actual physical location of the files is. You
   could have created a directory on your hard disk called /cdrom and put
   some files in it, and everything would behave in exactly the same way.
   Once you mount a filesystem, there’s no need to pay any attention to
   physical devices.
'),
('73', '1', '12', '
'),
('73', '1', '13', '
   However, before you can mount a filesystem or actually create a filesystem
   on a disk that doesn’t have one yet, it’s necessary to refer to the
   devices themselves. All devices have names, which are located in the /dev
   directory. If you type ls /dev now, you’ll see a pretty lengthy list of
   every possible device you could have on your Debian system. For a summary
   of some devices, see Table 2.1 on page [*]. A more thorough list can be
   found on your system in the file /usr/src/linux/Documentation/devices.txt.
'),
('73', '1', '14', '
'),
('73', '1', '15', '
   To mount a filesystem, we want to tell Linux to associate whatever
   filesystem it finds on a particular device with a particular mount point.
   In the process, we might have to tell Linux what kind of filesystem to
   look for.
'),
('73', '1', '16', '
'),
('73', '7', '17', '
10.2.2 Example: Mounting a CD-ROM
'),
('73', '1', '18', '
'),
('73', '1', '19', '
   As a simple demonstration, we’ll go through mounting a CD-ROM, such as the
   one you may have used to install Debian. You’ll need to be root to do
   this, so be careful; whenever you’re root, you have the power to
   manipulate the whole system, not just your own files. Also, these commands
   assume there’s a CD in your drive; you should put one in the drive now.
   Then start with the following command:
'),
('73', '1', '20', '
'),
('73', '6', '21', '
   su
'),
('73', '1', '22', '
'),
('73', '4', '23', '
   If you haven’t already, you need to either log in as root or gain root
   privileges with the su (super user) command. If you use su, enter the root
   password when prompted.
'),
('73', '1', '24', '
'),
('73', '6', '25', '
   ls /cdrom
'),
('73', '1', '26', '
'),
('73', '4', '27', '
   Use this command to see what’s in the /cdrom directory before you start.
   If you don’t have a /cdrom directory, you may have to make one using
   mkdir /cdrom.
'),
('73', '1', '28', '
'),
('73', '6', '29', '
   mount
'),
('73', '1', '30', '
'),
('73', '4', '31', '
   Simply typing mount with no arguments lists the currently mounted
   filesystems.
'),
('73', '1', '32', '
'),
('73', '6', '33', '
   mount -t iso9660 CD-device /cdrom
'),
('73', '1', '34', '
'),
('73', '4', '35', '
   For this command, you should substitute the name of your CD-ROM device for
   CD-device in the above command line. If you aren’t sure, /dev/cdrom is a
   good guess because the install process should have created this symbolic
   link on the system. If that fails, try the different IDE devices:
   /dev/hdc, etc. You should see a message like this: mount: block device
   /dev/hdc is write-protected, mounting read-only.
'),
('73', '1', '36', '
'),
('73', '1', '37', '
   The -t option specifies the type of the filesystem, in this case iso9660.
   Most CDs are iso9660. The next argument is the name of the device to
   mount, and the final argument is the mount point. There are many other
   arguments for mount; see the manual page for details.
'),
('73', '1', '38', '
'),
('73', '1', '39', '
   Once a CD is mounted, you may find that your drive tray will not open. You
   must unmount the CD before removing it.
'),
('73', '1', '40', '
'),
('73', '6', '41', '
   ls /cdrom
'),
('73', '1', '42', '
'),
('73', '4', '43', '
   Confirms that /cdrom now contains whatever is on the CD in your drive.
'),
('73', '1', '44', '
'),
('73', '6', '45', '
   mount
'),
('73', '1', '46', '
'),
('73', '4', '47', '
   Displays the list of filesystems again; notice that your CD drive is now
   mounted.
'),
('73', '1', '48', '
'),
('73', '6', '49', '
   umount /cdrom
'),
('73', '1', '50', '
'),
('73', '4', '51', '
   This unmounts the CD. It’s now safe to remove the CD from the drive.
   Notice that the command is umount with no “n,” even though it’s used to
   unmount the filesystem.
'),
('73', '1', '52', '
'),
('73', '6', '53', '
   exit
'),
('73', '1', '54', '
'),
('73', '4', '55', '
   Don’t leave yourself logged on as root. Log out immediately, just to be
   safe.
'),
('73', '1', '56', '
'),
('73', '7', '57', '
10.2.3 /etc/fstab: Automating the Mount Process
'),
('73', '1', '58', '
'),
('73', '1', '59', '
   The file /etc/fstab (it stands for “filesystem table”) contains
   descriptions of filesystems that you mount often. These filesystems can
   then be mounted with a shorter command, such as mount /cdrom. You can also
   configure filesystems to mount automatically when the system boots. You’ll
   probably want to mount all of your hard disk filesystems when you boot, so
   Debian automatically adds entries to fstab to do this for you.
'),
('73', '1', '60', '
'),
('73', '1', '61', '
   Look at this file now by typing more /etc/fstab. It will have two or more
   entries that were configured automatically when you installed the system.
   It probably looks something like this:
'),
('73', '1', '62', '
'),
('73', '6', '63', '
   # /etc/fstab: static file system information.

   #

   #     # 

   /dev/hda1 / ext2 defaults 0 1

   /dev/hda3 none swap sw 0 0

   proc /proc proc defaults 0 0

   /dev/hda5 /tmp ext2 defaults 0 2

   /dev/hda6 /home ext2 defaults 0 2

   /dev/hda7 /usr ext2 defaults 0 2

   /dev/hdc /cdrom iso9660 ro,noauto 0 0

   /dev/fd0 /floppy auto noauto,sync 0 0


'),
('73', '4', '64', '
   The first column lists the device the filesystem resides on. The second
   lists the mount point, the third indicates the filesystem type. The line
   beginning by proc is a special filesystem. Notice that the swap partition
   (/dev/hda3 in the example) has no mount point, so the mount point column
   contains none.
'),
('73', '1', '65', '
'),
('73', '1', '66', '
   The last three columns may require some explanation.
'),
('73', '1', '67', '
'),
('73', '1', '68', '
   The fifth column is used by the dump utility to decide when to back up the
   filesystem. In most cases, you can put 0 here.
'),
('73', '1', '69', '
'),
('73', '1', '70', '
   The sixth column is used by fsck to decide in what order to check
   filesystems when you boot the system. The root filesystem should have a 1
   in this field, filesystems that don’t need to be checked (such as the swap
   partition) should have a 0, and all other filesystems should have a 2.
   It’s worth noting that the swap partition isn’t exactly a filesystem in
   the sense that it does not contain files and directories but is just used
   by the Linux kernel as secondary memory. However, for historical reasons,
   the swap partitions are still listed in the same file as the filesystems.
'),
('73', '1', '71', '
'),
('73', '1', '72', '
   Column four contains one or more options to use when mounting the
   filesystem. You can check the mount manpage for a summary; see section 5.1
   on page [*].
'),
('73', '1', '73', '
'),
('73', '7', '74', '
10.2.4 Removable Disks (Floppies, Zip Disks, Etc.)
'),
('73', '1', '75', '
'),
('73', '1', '76', '
   Add the following lines to your /etc/fstab file:
'),
('73', '1', '77', '
'),
('73', '6', '78', '
   /dev/sda1 /mnt/zip ext2 noauto,user 0 0

   /dev/sda4 /mnt/dos msdos noauto,user 0 0
'),
('73', '1', '79', '
'),
('73', '4', '80', '
   From now on, you’ll be able to mount the DOS-formatted Zip disks with the
   command mount /mnt/dos, and you be able to mount Linux-formatted Zip disks
   with the command mount /mnt/zip.
'),
('73', '1', '81', '
'),
('73', '1', '82', '
   If you have SCSI hard disks in your system, you’ll have to change sda to
   sdb or sdc in the example above.
'),
('74', '1', '0', '
'),
('74', '1', '1', '
   Backups are important under any operating system. Debian GNU/Linux
   provides several different utilities that you might want to use.
   Additionally, while many of these utilities were aimed at tape backups
   originally, you’ll find that they are now being used for other things. For
   instance, tar is being used for distributing programs over the Internet.
   Some of the utilities that you’ll find include the following:
'),
('74', '1', '2', '
'),
('74', '9', '3', '
     ◼ Taper is a menu-driven, easy-to-learn backup program that can back up
       to a variety of media. Its limitation is that it doesn’t handle large
       (4GB or larger) backups.

     ◼ dump is designed specifically for tapes; its main strengths are its
       interface for file restores, low-level filesystem backups, and
       incremental backup scheduling. Its limitations include the inability
       to back up NFS or other non-ext2 filesystems and some rather arcane
       defaults.

     ◼ GNU tar (short for Tape ARchiver) is an implementation of what is
       probably the most widely used backup or archiving utility in Linux
       today. It makes a good general purpose tool and can deal with the
       widest variety of target media. Additionally, many different systems
       can read tar files, making them highly portable. tar’s weaknesses
       include a weaker incremental backup system than dump and no
       interactive restore selection screen.
'),
('74', '1', '4', '
'),
('74', '7', '5', '
10.3.1 tar
'),
('74', '1', '6', '
'),
('74', '1', '7', '
   Because tar is used so much, and for quite a bit in addition to backups,
   it is being described here. For more details, see the tar manual page;
   instructions for viewing manual pages can be found in section 5.1 on page
   [*].
'),
('74', '1', '8', '
'),
('74', '1', '9', '
   tar is an archiver. This means that tar can take many files and combine
   them all into one large file or write them out to a backup device such as
   a tape drive. Once you have this one large file, you will often want to
   compress it; the -z option is great for this. Hence, tar offers a great
   way to distribute programs and data on the Internet, and you’ll find that
   it is used extensively for this purpose.
'),
('74', '1', '10', '
'),
('74', '1', '11', '
   Here’s a sample tar command line:
'),
('74', '1', '12', '
'),
('74', '6', '13', '
   tar -zcvf myfiles.tar.gz /usr/local/bin
'),
('74', '1', '14', '
'),
('74', '4', '15', '
   Let’s take a look at how this command can be broken down:
'),
('74', '1', '16', '
'),
('74', '6', '17', '
   tar
'),
('74', '1', '18', '
'),
('74', '4', '19', 'Name of the command.—Tells tar that options will
follow.
'),
('74', '1', '20', '
'),
('74', '6', '21', '
   z
'),
('74', '1', '22', '
'),
('74', '4', '23', '
Tells tar to use gzip compression automatically; if you use this, it’s
good to add a .gz extension as well.
'),
('74', '1', '24', '
'),
('74', '6', '25', '
   c
'),
('74', '1', '26', '
'),
('74', '4', '27', '
Tells tar to create a new archive.
'),
('74', '1', '28', '
'),
('74', '6', '29', '
   v
'),
('74', '1', '30', '
'),
('74', '4', '31', '
This says to be verbose; that is, it tells tar to let you know what it’s
doing while it creates the archive.
'),
('74', '1', '32', '
'),
('74', '6', '33', '
   f
'),
('74', '1', '34', '
'),
('74', '4', '35', '
This indicates that the next thing on the command line is the name of the file
to be created or the device to be used. If I used /dev/st0 here, for instance,
it would write the backup to the tape drive.
'),
('74', '1', '36', '
'),
('74', '6', '37', '
   myfiles.tar.gz
           This is the name of the file to be created.
'),
('74', '1', '38', '
'),
('74', '6', '39', '
   /usr/local/bi
'),
('74', '1', '40', '
'),
('74', '4', '41', '
   This is the name of the file or directory to store in the archive.
   It’s also possible to specify several items here.
'),
('74', '1', '42', '
'),
('74', '1', '43', '
   You may often find tar.gz files (or simply tgz files) on the Internet. You
   can unpack these with a command like:
'),
('74', '1', '44', '
'),
('74', '6', '45', '
   tar -zxvf filename.tar.gz
'),
('75', '1', '0', '
'),
('75', '1', '1', '
   One of the key benefits of GNU/Linux over other systems lies in its
   networking support. Few systems can rival the networking features present
   in GNU/Linux. In this chapter, we tell you how to configure your network
   devices.
'),
('76', '1', '0', '
'),
('76', '1', '1', '
   This section is a quick-start guide to setting up PPP on Debian. If it
   turns out that you need more details, see the excellent |PPP HOWTO| from
   the Linux Documentation Project. The HOWTO goes into much more detail if
   you’re interested or have unique needs.
'),
('76', '1', '2', '
'),
('76', '7', '3', '
11.1.1 Introduction
'),
('76', '1', '4', '
'),
('76', '1', '5', '
   If you connect to the Internet over a phone line, you’ll want to use PPP
   (Point-to-Point Protocol). This is the standard connection method offered
   by ISPs (Internet service providers). In addition to using PPP to dial
   your ISP, you can have your computer listen for incoming connections -
   this lets you dial your computer from a remote location.
'),
('76', '1', '6', '
'),
('76', '7', '7', '
11.1.2 Preparation
'),
('76', '1', '8', '
'),
('76', '1', '9', '
   Configuring PPP on Debian GNU/Linux is straightforward once you have all
   the information you’ll need. Debian makes things even easier with its
   simple configuration tools.
'),
('76', '1', '10', '
'),
('76', '1', '11', '
   Before you start, be sure you have all the information provided by your
   ISP. This might include:
'),
('76', '1', '12', '
'),
('76', '9', '13', '
     ◼ Username or login

     ◼ Password

     ◼ Your static IP (Internet Protocol) address, if any (these look like
       209.81.8.242). This information isn’t needed for most ISPs.

     ◼ Bitmask (this will look something like 255.255.255.248). This
       information isn’t needed for most ISPs.

     ◼ The IP addresses of your ISP’s name servers (or DNS).

     ◼ Any special login procedure required by the ISP.
'),
('76', '1', '14', '
'),
('76', '4', '15', '
   Next, you’ll want to investigate your hardware setup: whether your modem
   works with GNU/Linux and which serial port it’s connected to.
'),
('76', '1', '16', '
'),
('76', '1', '17', '
   A simple rule determines whether your modem will work. If it’s a
   “winmodem” or “host-based modem,” it won’t work. These modems are
   cheap because they have very little functionality, and they require the
   computer to make up for their shortcomings. Unfortunately, this means they
   are complex to program, and manufacturers generally do not make the
   specifications available for developers.
'),
('76', '1', '18', '
'),
('76', '1', '19', '
   If you have a modem with its own on-board circuitry or an external modem,
   you should have no trouble at all.
'),
('76', '1', '20', '
'),
('76', '1', '21', '
   On GNU/Linux systems, the serial ports are referred to as /dev/ttyS0,
   /dev/ttyS1, and so on. Your modem is almost certainly connected to either
   port 0 or port 1, equivalent to COM1: and COM2: under Windows. If you
   don’t know which your modem is connected to, run the program wvdialconf to
   try to detect it (see below); otherwise, just try both and see which
   works.
'),
('76', '1', '22', '
'),
('76', '1', '23', '
   If you want to talk to your modem or dial your ISP without using PPP, you
   can use the minicom program. You may need to install the minicom package
   to make the program available.
'),
('76', '1', '24', '
'),
('76', '7', '25', '
11.1.3 The Easy Way: wvdial
'),
('76', '1', '26', '
'),
('76', '1', '27', '
   The simplest way to get PPP running is with the wvdial program. It makes
   some reasonable guesses and tries to set things up for you. If it works,
   you’re in luck. If it guesses wrong, you’ll have to do things manually.
'),
('76', '1', '28', '
'),
('76', '1', '29', '
   Be sure you have the following packages installed:
'),
('76', '1', '30', '
'),
('76', '9', '31', '
     ◼ ppp

     ◼ ppp-pam

     ◼ wvdial
'),
('76', '1', '32', '
'),
('76', '4', '33', '
   When you install the wvdial package, you may be given the opportunity to
   configure it. Otherwise, to set up wvdial, follow these simple steps:
'),
('76', '1', '34', '
'),
('76', '1', '35', '
   Log in as root, using su (as described in an earlier chapter).
'),
('76', '1', '36', '
'),
('76', '6', '37', '
   touch /etc/wvdial.conf
'),
('76', '1', '38', '
'),
('76', '4', '39', '
   touch will create the following file if the file doesn’t exist; the
   configuration program requires an existing file.
'),
('76', '1', '40', '
'),
('76', '6', '41', '
   wvdialconf /etc/wvdial.conf
'),
('76', '1', '42', '
'),
('76', '4', '43', '
   This means you’re creating a configuration file, /etc/wvdial.conf.
'),
('76', '1', '44', '
'),
('76', '1', '45', '
   Answer any questions that appear on the screen. wvdialconf will also scan
   for your modem and tell you which serial port it’s on; you may want to
   make a note of this for future reference.
'),
('77', '1', '0', '
'),
('77', '1', '1', '
   Another popular way to connect to the Internet is via a LAN that uses
   Ethernet. This gives you a high-speed local network in addition to
   Internet access. Fortunately, though, you should have already configured
   Ethernet networking during installation so there isn’t much you need to do
   now. If you ever need to modify your configuration, here are the files
   that you will be interested in:
'),
('77', '1', '2', '
'),
('77', '9', '3', '
     ◼ /etc/init.d/network has things such as your IP address, netmask, and
       default route.

     ◼ /etc/hostname records your hostname.

     ◼ /etc/hosts also records your hostname and IP address.
'),
('78', '1', '0', '
'),
('78', '1', '1', '
   This chapter describes ways of installing and removing software packages.
   There are several ways of doing both. Here we discuss installation and
   removal of pre-built software, such as Debian packages, and installation
   of source that must be built by you.
'),
('79', '1', '0', '
'),
('79', '1', '1', '
   An application or utility program usually involves quite a few files. It
   might include libraries, data files like game scenarios or icons,
   configuration files, manual pages, and documentation. When you install the
   program, you want to make sure you have all the files you need in the
   right places.
'),
('79', '1', '2', '
'),
('79', '1', '3', '
   You’d also like to be able to uninstall the program. When you uninstall,
   you want to be sure all the associated files are deleted. However, if a
   program you still have on the system needs those files, you want to be
   sure you keep them.
'),
('79', '1', '4', '
'),
('79', '1', '5', '
   Finally, you’d like to be able to upgrade a program. When you upgrade, you
   want to delete obsolete files and add new ones, without breaking any part
   of the system.
'),
('79', '1', '6', '
'),
('79', '1', '7', '
   The Debian package system solves these problems. It allows you to install,
   remove, and upgrade software packages, which are neat little bundles
   containing the program files and information that helps the computer manage
   them properly. Debian packages have filenames ending in the extension .deb,
   and they’re available on the FTP site or on your official Debian
   CD-ROM.
'),
('80', '1', '0', '
'),
('80', '1', '1', '
   The simplest way to install a single package you’ve downloaded is with the
   command dpkg -i (short for dpkg -install). Say you’ve downloaded the
   package icewm_0.8.12-1.deb and you’d like to install it. First log on as
   root, and then type dpkg -i icewm_0.8.12-1.deb, and icewm version 0.8.12
   will be installed. If you already had an older version, dpkg will upgrade
   it rather than installing both versions at once.
'),
('80', '1', '2', '
'),
('80', '1', '3', '
   If you want to remove a package, you have two options. The first is most
   intuitive: dpkg -r icewm. This will remove the icewm package (-r is short
   for -remove). Note that you give only the icewm for -remove, whereas
   -install requires the entire .deb filename.
'),
('80', '1', '4', '
'),
('80', '1', '5', '
   -remove will leave configuration files for the package on your system. A
   configuration file is defined as any file you might have edited in order
   to customize the program for your system or your preferences. This way, if
   you later reinstall the package, you won’t have to set everything up a
   second time.
'),
('80', '1', '6', '
'),
('80', '1', '7', '
   However, you might want to erase the configuration files too, so dpkg also
   provides a -purge option. dpkg -purge icewm will permanently delete every
   last file associated with the icewm package.
'),
('81', '1', '0', '
'),
('81', '1', '1', '
   dselect is a great front-end for dpkg. dselect provides a menu interface
   for dpkg, and can automatically fetch the appropriate files from a CD-ROM
   or Internet FTP site. For details on using dselect, see section 3.20 on
   page [*].
'),
('82', '1', '0', '
'),
('82', '1', '1', '
   Many programs come in source format, often in tar.gz form. First, you must
   unpack the tar.gz file; for details on doing this, see section 10.3.1 on
   page [*]. Before you can compile the package, you’ll need to have gcc,
   libc6-dev, and other relevant “-dev” packages installed; most of these
   are listed in the devel area in dselect.
'),
('82', '1', '2', '
'),
('82', '1', '3', '
   With the appropriate packages installed, cd into the directory that tar
   created for you. At this point, you’ll need to read the installation
   instructions. Most programs provide an INSTALL or README file that will
   tell you how to proceed.
'),
('83', '1', '0', '
'),
('83', '1', '1', '
   By now, you should have a strong base for which to build your GNU/Linux
   skills on. In this chapter we cover some very useful information regarding
   some advanced GNU/Linux features.
'),
('84', '1', '0', '
'),
('84', '1', '1', '
   A regular expression is a description of a set of characters. This
   description can be used to search through a file by looking for text that
   matches the regular expression. Regular expressions are analogous to shell
   wildcards (see section 6.6 on page [*]), but they are both more
   complicated and more powerful.
'),
('84', '1', '2', '
'),
('84', '1', '3', '
   A regular expression is made up of text and metacharacters. A
   metacharacter is just a character with a special meaning. Metacharacters
   include the following: . * [] - \^ $.
'),
('84', '1', '4', '
'),
('84', '1', '5', '
   If a regular expression contains only text (no metacharacters), it matches
   that text. For example, the regular expression “my regular expression”
   matches the text “my regular expression,” and nothing else. Regular
   expressions are usually case sensitive.
'),
('84', '1', '6', '
'),
('84', '1', '7', '
   You can use the egrep command to display all lines in a file that contain
   a regular expression. Its syntax is as follows:
'),
('84', '1', '8', '
'),
('84', '6', '9', '
   egrep ’regexp’ filename1 ...
'),
('84', '1', '10', '
'),
('84', '4', '11', '
   The single quotation marks are not always needed, but they never hurt.
'),
('84', '1', '12', '
'),
('84', '1', '13', '
   For example, to find all lines in the GPL that contain the word GNU, you
   type
'),
('84', '1', '14', '
'),
('84', '6', '15', '
   egrep ’GNU’ /usr/doc/copyright/GPL
'),
('84', '1', '16', '
'),
('84', '4', '17', '
   egrep will print the lines to standard output. If you want all lines that
   contain freedom followed by some indeterminate text, followed by GNU, you
   can do this:
'),
('84', '1', '18', '
'),
('84', '6', '19', '
   egrep ’freedom.*GNU’ /usr/doc/copyright/GPL
'),
('84', '1', '20', '
'),
('84', '4', '21', '
   The . means “any character,” and the * means “zero or more of the
   preceding thing,” in this case “zero or more of any character.” So .*
   matches pretty much any text at all. egrep only matches on a line-by-line
   basis, so freedom and GNU have to be on the same line.
'),
('84', '1', '22', '
'),
('84', '1', '23', '
   Here’s a summary of regular expression metacharacters:
'),
('84', '1', '24', '
'),
('84', '1', '25', '
   . Matches any single character except newline.
'),
('84', '1', '26', '
'),
('84', '1', '27', '
   * Matches zero or more occurrences of the preceding thing. So the expression
   a* matches zero or more lowercase a, and .* matches zero or more characters.
'),
('84', '1', '28', '
'),
('84', '1', '29', '
   [characters] The brackets must contain one or more characters; the
   whole bracketed expression matches exactly one character out of the set. So
   [abc]matches one a, one b, or one c; it does not match zero characters, and
   it does not match a character other than these three.
'),
('84', '1', '30', '
'),
('84', '1', '31', '
   ^ Anchors your search at the beginning of the line. The expression ^The
   matches The when it appears at the beginning of a line; there can’t be
   spaces or other text before The. If you want to allow spaces, you can permit
   0 or more space characters like this: ^ *The.
'),
('84', '1', '32', '
'),
('84', '1', '33', '
   $ Anchors at the end of the line. end$ requires the text end to be at the
   end of the line, with no intervening spaces or text.
'),
('84', '1', '34', '
'),
('84', '1', '35', '
   [^characters] This reverses the sense of a bracketed character list.
   So [^abc] matches any single character, except a, b, or c.
'),
('84', '1', '36', '
'),
('84', '1', '37', '
   [character-character] You can include ranges in a bracketed character
   list. To match any lowercase letter, use [a-z]. You can have more than one
   range; so to match the first three or last three letters of the alphabet,
   try [a-cx-z]. To get any letter, any case, try [a-zA-Z]. You can mix ranges
   with single characters and with the ^metacharacter; for example,
   [^a-zBZ]means “anything except a lowercase letter, capital B, or
   capital Z.”
'),
('84', '1', '38', '
'),
('84', '1', '39', '
   () You can use parentheses to group parts of the regular expression, just as
   you do in a mathematical expression.
'),
('84', '1', '40', '
'),
('84', '1', '41', '
   || means “or.” You can use it to provide a series of
alternative expressions. Usually you want to put the alternatives in
parentheses, like this: c(ad|ab|at)matches cad or cab or cat. Without the
parentheses, it would match cad or ab or at instead
'),
('84', '1', '42', '
'),
('84', '1', '43', '
   \ Escapes any special characters; if you want to find a literal *, you type
   \*. The slash means to ignore *’s usual special meaning.
'),
('84', '1', '44', '
'),
('84', '1', '45', '
   Here are some more examples to help you get a feel for things:
'),
('84', '1', '46', '
'),
('84', '1', '47', '
   c.pe matches cope, cape, caper.
'),
('84', '1', '48', '
'),
('84', '1', '49', '
   c\ .pe matches c.pe, c.per.
'),
('84', '1', '50', '
'),
('84', '1', '51', '
   sto*p matches stp, stop, stoop.
'),
('84', '1', '52', '
'),
('84', '1', '53', '
   car.*n matches carton, cartoon, carmen.
'),
('84', '1', '54', '
'),
('84', '1', '55', '
   xyz.* matches xyz and anything after it; some tools, like egrep, only
match until the end of the line.
'),
('84', '1', '56', '
'),
('84', '1', '57', '
   ^The matches The at the beginning of a line.
'),
('84', '1', '58', '
'),
('84', '1', '59', '
   atime$ matches atime at the end of a line.
'),
('84', '1', '60', '
'),
('84', '1', '61', '
   ^Only$ matches a line that consists solely of the word Only—no spaces,
no other characters, nothing. Only Only is allowed.
'),
('84', '1', '62', '
'),
('84', '1', '63', '
   b[aou]rn matches barn, born, burn.
'),
('84', '1', '64', '
'),
('84', '1', '65', '
   Ver[D-F] matches VerD, VerE, VerF.
'),
('84', '1', '66', '
'),
('84', '1', '67', '
   Ver[^0-9] matches Ver followed by any non-digit.
'),
('84', '1', '68', '
'),
('84', '1', '69', '
   the[ir][re] matches their, therr, there, theie.
'),
('84', '1', '70', '
'),
('84', '1', '71', '
   [A-Za-z][A-Za-z]* matches any word which consists of only letters, and at
   least one letter. It will not match numbers or spaces.
'),
('85', '1', '0', '
'),
('85', '1', '1', '
   Now that you have a basic understanding of files, it is time to learn more
   advanced things about them.
'),
('85', '1', '2', '
'),
('85', '7', '3', '
13.2.1 The Real Nature of Files: Hard Links and Inodes
'),
('85', '1', '4', '
'),
('85', '1', '5', '
   Each file on your system is represented by an inode (for Information
   Node; pronounced “eye-node”). An inode contains all the
   information about the file. However, the inode is not directly visible.
   Instead, each inode is linked into the filesystem by one or more hard
   links. Hard links contain the name of the file and the inode number. The
   inode contains the file itself, i.e., the location of the information being
   stored on disk, its access permissions, the file type, and so on. The system
   can find any inode if it has the inode number.
'),
('85', '1', '6', '
'),
('85', '1', '7', '
   A single file can have more than one hard link. What this means is that
   multiple filenames refer to the same file (that is, they are associated
   with the same inode number). However, you can’t make hard links across
   filesystems: All hard references to a particular file (inode) must be on
   the same filesystem. This is because each filesystem has its own set of
   inodes, and there can be duplicate inode numbers on different filesystems.
'),
('85', '1', '8', '
'),
('85', '1', '9', '
   Because all hard links to a given inode refer to the same file, you
   can make changes to the file, referring to it by one name, and then see
   those changes when referring to it by a different name. Try this:
'),
('85', '1', '10', '
'),
('85', '6', '11', '
   cd; echo "hello" > firstlink
'),
('85', '1', '12', '
'),
('85', '4', '13', '
   cd to your home directory and create a file called firstlink containing
   the word “hello.” What you’ve actually done is redirect the output of
   echo (echo just echoes back what you give to it), placing the output in
   firstlink. See the chapter on shells for a full explanation.
'),
('85', '1', '14', '
'),
('85', '6', '15', '
   cat firstlink
'),
('85', '1', '16', '
'),
('85', '4', '17', '
   Confirms the contents of firstlink.
'),
('85', '1', '18', '
'),
('85', '6', '19', '
   ln firstlink secondlink
'),
('85', '1', '20', '
'),
('85', '4', '21', '
   Creates a hard link: secondlink now points to the same inode as firstlink.
'),
('85', '1', '22', '
'),
('85', '6', '23', '
   cat secondlink
'),
('85', '1', '24', '
'),
('85', '4', '25', '
   Confirms that secondlink is the same as firstlink.
'),
('85', '1', '26', '
'),
('85', '6', '27', '
   ls -l
'),
('85', '1', '28', '
'),
('85', '4', '29', '
   Notice that the number of hard links listed for firstlink and
   secondlinkfiles!inodes is 2.
'),
('85', '1', '30', '
'),
('85', '6', '31', '
   echo "change" >> secondlink
'),
('85', '1', '32', '
'),
('85', '4', '33', '
   This is another shell redirection trick (don’t worry about the details).
   You’ve appended the word “change” to secondlink. Confirm this with cat
   secondlink.
'),
('85', '1', '34', '
'),
('85', '6', '35', '
   cat firstlink
'),
('85', '1', '36', '
'),
('85', '4', '37', '
   firstlink also has the word “change” appended! That’s
   because firstlink and secondlink refer to the same file. It
   doesn’t matter what you call it when you change it.
'),
('85', '1', '38', '
'),
('85', '6', '39', '
   chmod a+rwx firstlink
'),
('85', '1', '40', '
'),
('85', '4', '41', '
   Changes permissions on firstlink. Enter the command ls -l to confirm that
   permissions on secondlink were also changed. This means that permissions
   information is stored in the inode, not in links.
'),
('85', '1', '42', '
'),
('85', '6', '43', '
   rm firstlink
'),
('85', '1', '44', '
'),
('85', '4', '45', '
   Deletes this link. This is a subtlety of rm. It really removes links, not
   files. Now type ls -l and notice that secondlink is still there. Also
   notice that the number of hard links for secondlink has been reduced to
   one.
'),
('85', '1', '46', '
'),
('85', '6', '47', '
   rm secondlink
'),
('85', '1', '48', '
'),
('85', '4', '49', '
   Deletes the other link. When there are no more links to a file, Linux
   deletes the file itself, that is, its inode.
'),
('85', '1', '50', '
'),
('85', '1', '51', '
   All files work like this—even special types of files such as devices
   (e.g. /dev/hda).
'),
('85', '1', '52', '
'),
('85', '1', '53', '
   A directory is simply a list of filenames and inode numbers, that is, a
   list of hard links. When you create a hard link, you’re just adding a
   name-number pair to a directory. When you delete a file, you’re just
   removing a hard link from a directory.
'),
('85', '1', '54', '
'),
('85', '7', '55', '
13.2.2 Types of Files
'),
('85', '1', '56', '
'),
('85', '1', '57', '
   One detail we’ve been concealing up to now is that the Linux kernel
   considers nearly everything to be a file. That includes directories and
   devices: They’re just special kinds of files.
'),
('85', '1', '58', '
'),
('85', '1', '59', '
   As you may remember, the first character of an ls -l display represents
   the type of the file. For an ordinary file, this will be simply -. Other
   possibilities include the following:
'),
('85', '1', '60', '
'),
('85', '6', '61', '
   ddirectory

   lsymbolic link

   bblock device

   ccharacter device

   pnamed pipe

   ssocket
'),
('85', '1', '62', '
'),
('85', '7', '63', '
  Symbolic Links
'),
('85', '1', '64', '
'),
('85', '1', '65', '
   Symbolic links (also called “symlinks” or “soft links”) are the other
   kind of link besides hard links. A symlink is a special file that “points
   to” a hard link on any mounted filesystem. When you try to read the
   contents of a symlink, it gives the contents of the file it’s pointing to
   rather than the contents of the symlink itself. Because directories,
   devices, and other symlinks are types of files, you can point a symlink at
   any of those things.
'),
('85', '1', '66', '
'),
('85', '1', '67', '
   So a hard link is a filename and an inode number. A file is really an
   inode: a location on disk, file type, permissions mode, etc. A symlink is
   an inode that contains the name of a hard link. A symlink pairs one
   filename with a second filename, whereas a hard link pairs a filename with
   an inode number.
'),
('85', '1', '68', '
'),
('85', '1', '69', '
   All hard links to the same file have equal status. That is, one is as good
   as another; if you perform any operation on one, it’s just the same as
   performing that operation on any of the others. This is because the hard
   links all refer to the same inode. Operations on symlinks, on the other
   hand, sometimes affect the symlink’s own inode (the one containing the
   name of a hard link) and sometimes affect the hard link being pointed to.
'),
('85', '1', '70', '
'),
('85', '1', '71', '
   There are a number of important differences between symlinks and hard
   links.
'),
('85', '1', '72', '
'),
('85', '1', '73', '
   Symlinks can cross filesystems. This is because they contain complete
   filenames, starting with the root directory, and all complete filenames
   are unique. Because hard links point to inode numbers, and inode numbers
   are unique only within a single filesystem, they would be ambiguous if the
   filesystem wasn’t known.
'),
('85', '1', '74', '
'),
('85', '1', '75', '
   You can make symlinks to directories, but you can’t make hard links to
   them. Each directory has hard links—its listing in its parent directory,
   its . entry, and the .. entry in each of its subdirectories—but to
   impose order on the filesystem, no other hard links to directories are
   allowed. Consequently, the number of files in a directory is equal to the
   number of hard links to that directory minus two (you subtract the
   directory’s name and the . link). comparing!hard links and symlinks You
   can only make a hard link to a file that exists, because there must be an
   inode number to refer to. However, you can make a symlink to any filename,
   whether or not there actually is such a filename.
'),
('85', '1', '76', '
'),
('85', '1', '77', '
   Removing a symlink removes only the link. It has no effect on the
   linked-to file. Removing the only hard link to a file removes the file.
'),
('85', '1', '78', '
'),
('85', '1', '79', '
   Try this:
'),
('85', '1', '80', '
'),
('85', '6', '81', '
   cd; ln -s /tmp/me MyTmp
'),
('85', '1', '82', '
'),
('85', '4', '83', '
   cd to your home directory. ln with the -s option makes a symbolic link -
   in this case, one called MyTmp that points to the filename /tmp/me.
'),
('85', '1', '84', '
'),
('85', '6', '85', '
   ls -l MyTmp
'),
('85', '1', '86', '
'),
('85', '4', '87', '
   Output should look like this:
'),
('85', '1', '88', '
'),
('85', '6', '89', '
   lrwxrwxrwx 1 havoc havoc 7 Dec 6 12:50 MyTmp -> /tmp/me
'),
('85', '1', '90', '
'),
('85', '4', '91', '
   The date and user/group names will be different for you, of course. Notice
   that the file type is l, indicating that this is a symbolic link. Also
   notice the permissions: Symbolic links always have these permissions. If
   you attempt to chmod a symlink, you’ll actually change the permissions on
   the file being pointed to.
'),
('85', '1', '92', '
'),
('85', '6', '93', '
   chmod 700 MyTmp
'),
('85', '1', '94', '
'),
('85', '4', '95', '
   You will get a No such file or directory error, because the file /tmp/me
   doesn’t exist. Notice that you could create a symlink to it anyway.
'),
('85', '1', '96', '
'),
('85', '6', '97', '
   mkdir /tmp/me
'),
('85', '1', '98', '
'),
('85', '4', '99', '
   Creates the directory /tmp/me.
'),
('85', '1', '100', '
'),
('85', '6', '101', '
   chmod 700 MyTmp
'),
('85', '1', '102', '
'),
('85', '4', '103', '
   Should work now.
'),
('85', '1', '104', '
'),
('85', '6', '105', '
   touch MyTmp/myfile
'),
('85', '1', '106', '
'),
('85', '4', '107', '
   Creates a file in MyTmp.
'),
('85', '1', '108', '
'),
('85', '6', '109', '
   ls /tmp/me
'),
('85', '1', '110', '
'),
('85', '4', '111', '
   The file is actually created in /tmp/me.
'),
('85', '1', '112', '
'),
('85', '6', '113', '
   rm MyTmp
'),
('85', '1', '114', '
'),
('85', '4', '115', '
   Removes the symbolic link. Notice that this removes the link, not what it
   points to. Thus you use rm not rmdir.
'),
('85', '1', '116', '
'),
('85', '6', '117', '
   rm /tmp/me/myfile; rmdir /tmp/me
'),
('85', '1', '118', '
'),
('85', '4', '119', '
   Lets you clean up after yourself. symlinks!removing
'),
('85', '1', '120', '
'),
('85', '7', '121', '
  Device Files
'),
('85', '1', '122', '
'),
('85', '1', '123', '
   Device files refer to physical or virtual devices on your system, such as
   your hard disk, video card, screen, and keyboard. An example of a virtual
   device is the console, represented by /dev/console.
'),
('85', '1', '124', '
'),
('85', '1', '125', '
   There are two kinds of devices:character and block. Character devices
   can be accessed one character at a time. Remember the smallest unit of data
   that can be written to or read from the device is a character (byte).
'),
('85', '1', '126', '
'),
('85', '1', '127', '
Block devices must be accessed in larger units called blocks, which
   contain a number of characters. Your hard disk is a block device.
'),
('85', '1', '128', '
'),
('85', '1', '129', '
   You can read and write device files just as you can from other kinds of
   files, though the file may well contain some strange
   incomprehensible-to-humans gibberish. Writing random data to these files
   is probably a bad idea. Sometimes it’s useful, though. For example, you
   can dump a postscript file into the printer device /dev/lp0 or send modem
   commands to the device file for the appropriate serial port.
'),
('85', '1', '130', '
'),
('85', '1', '131', '
    /dev/null
'),
('85', '1', '132', '
'),
('85', '1', '133', '
   /dev/null is a special device file that discards anything you write to it.
   If you don’t want something, throw it in /dev/null. It’s essentially a
   bottomless pit. If you read /dev/null, you’ll get an end-of-file (EOF)
   character immediately. /dev/zero is similar, except that you read from it
   you get the \0 character (not the same as the number zero).
'),
('85', '1', '134', '
'),
('85', '7', '135', '
  Named Pipes (FIFOs)
'),
('85', '1', '136', '
'),
('85', '1', '137', '
   A named pipe is a file that acts like a pipe. You put something into the
   file, and it comes out the other end. Thus it’s called a FIFO, or
   First-In-First-Out, because the first thing you put in the pipe is the
   first thing to come out the other end.
'),
('85', '1', '138', '
'),
('85', '1', '139', '
   If you write to a named pipe, the process that is writing to the pipe
   doesn’t terminate until the information being written is read from the
   pipe. If you read from a named pipe, the reading process waits until
   there’s something to read before terminating. The size of the pipe is
   always zero: It doesn’t store data, it just links two processes like the
   shell |. However, because this pipe has a name, the two processes don’t
   have to be on the same command line or even be run by the same user.
'),
('85', '1', '140', '
'),
('85', '1', '141', '
   You can try it by doing the following:
'),
('85', '1', '142', '
'),
('85', '6', '143', '
   cd; mkfifo mypipe
'),
('85', '1', '144', '
'),
('85', '4', '145', '
   Makes the pipe.
'),
('85', '1', '146', '
'),
('85', '6', '147', '
           echo "hello" > mypipe &
'),
('85', '1', '148', '
'),
('85', '4', '149', '
   Puts a process in the background that tries to write “hello” to the
   pipe. Notice that the process doesn’t return from the background; it is
   waiting for someone to read from the pipe.
'),
('85', '1', '150', '
'),
('85', '6', '151', '
   cat mypipe
'),
('85', '1', '152', '
'),
('85', '4', '153', '
   At this point, the echo process should return, because cat read from the
   pipe, and the cat process will print hello.
'),
('85', '1', '154', '
'),
('85', '6', '155', '
   rm mypipe
'),
('85', '1', '156', '
'),
('85', '4', '157', '
   You can delete pipes just like any other file.
'),
('85', '1', '158', '
'),
('85', '7', '159', '
  Sockets
'),
('85', '1', '160', '
'),
('85', '1', '161', '
   Sockets are similar to pipes, only they work over the network. This is how
   your computer does networking. You may have heard of “WinSock,” which is
   sockets for Windows.
'),
('85', '1', '162', '
'),
('85', '1', '163', '
   We won’t go into these further because you probably won’t have occasion to
   use them unless you’re programming. However, if you see a file marked with
   type son your computer, you know what it is.
'),
('85', '1', '164', '
'),
('85', '7', '165', '
13.2.3 The proc Filesystem
'),
('85', '1', '166', '
'),
('85', '1', '167', '
   The Linux kernel makes a special filesystem available, which is mounted
   under /proc on Debian systems. This is a “pseudo-filesystem” because it
   doesn’t really exist on any of your physical devices.
'),
('85', '1', '168', '
'),
('85', '1', '169', '
   The proc filesystem contains information about the system and running
   processes. Some of the “files” in /proc are reasonably understandable to
   humans (try typing cat /proc/meminfo or cat /proc/cpuinfo); others are
   arcane collections of numbers. Often, system utilities use these to gather
   information and present it to you in a more understandable way.
'),
('85', '1', '170', '
'),
('85', '1', '171', '
   People frequently panic when they notice one file in particular—
   /proc/kcore —which is generally huge. This is (more or less) a copy of
   the contents of your computer’s memory. It’s used to debug the kernel. It
   doesn’t actually exist anywhere, so don’t worry about its size.
'),
('85', '1', '172', '
'),
('85', '1', '173', '
   If you want to know about all the things in /proc, type man 5 proc.
'),
('85', '1', '174', '
'),
('85', '7', '175', '
13.2.4 Large-Scale Copying
'),
('85', '1', '176', '
'),
('85', '1', '177', '
   Sometimes you may want to copy one directory to another location. Maybe
   you’re adding a new hard disk and you want to copy /usr/local to it. There
   are several ways you can do this.
'),
('85', '1', '178', '
'),
('85', '1', '179', '
   The first is to use cp. The command cp -a will tell cp to do a copy
   preserving all the information it can. So, you might use
'),
('85', '1', '180', '
'),
('85', '6', '181', '
   cp -a /usr/local /destination
'),
('85', '1', '182', '
'),
('85', '4', '183', '
   However, there are some things that cp -a won’t catch[1].
   So, the best way to do a large copy job is to chain two tar commands
   together, like so:
'),
('85', '1', '184', '
'),
('85', '3', '185', '
 [1]
Sparse files and hard links are two examples.
'),
('85', '1', '186', '
'),
('85', '6', '187', '
   tar -cSpf - /usr/local | tar -xvSpf -

   -C /destination
'),
('85', '1', '188', '
'),
('85', '4', '189', '
   The first tar command will archive the existing directory and pipe it to
   the second. The second command will unpack the archive into the location
   you specify with -C.
'),
('86', '1', '0', '
'),
('86', '1', '1', '
   Back in section 7.1 on page [*], we discussed file permissions in Linux.
   This is a fundamental way to keep your system secure. If you are running a
   multi-user system or a server, it is important to make sure that
   permissions are correct. A good rule of thumb is to set files to have the
   minimum permissions necessary for use.
'),
('86', '1', '2', '
'),
('86', '1', '3', '
   If you are running a network server, there are some other things to be
   aware of as well. First, you ought to uninstall or turn off any network
   services you’re not using. A good place to start is the file
   /etc/inetd.conf; you can probably disable some of these. For most network
   services, it’s also possible to control who has access to them; the
   /etc/hosts.allow and /etc/hosts.deny files (documented in
   man 5 hosts_access) can control who has access to which services. You also
   ought to keep up-to-date with patches or updates to Debian; these can be
   found on your nearest Debian FTP mirror.
'),
('86', '1', '4', '
'),
('86', '1', '5', '
   Some other commonsense rules apply:
'),
('86', '1', '6', '
'),
('86', '9', '7', '
     ◼ Never tell anyone your password.

     ◼ Never send your password in cleartext across the Internet by using
       something like telnet or FTP. Instead, use encrypted protocols or
       avoid logging in remotely.

     ◼ Avoid using root as much as possible.

     ◼ Don’t install untrusted software, and don’t install it as root.

     ◼ Avoid making things world-writable whenever possible. /tmp is one
       exception to this rule.
'),
('86', '1', '8', '
'),
('86', '4', '9', '
   While this is probably not of as much use to somebody not running a
   server, it is still pays to know a bit about security. Debian’s security
   mechanism is what protects your system from many viruses.
'),
('87', '1', '0', '
'),
('87', '1', '1', '
   Debian makes a great platform for software development and programming.
   Among the languages and near-languages it supports are: C, C++,
   Objective-C, Perl, Python, m4, Ada, Pascal, Java, awk, Tcl/Tk, SQL,
   assembler, Bourne shell, csh, and more. Writing programs is beyond the
   scope of this book, but here are some of the more popular development
   programs in Debian:
'),
('87', '1', '2', '
'),
('87', '1', '3', '
gcc
           The GNU C Compiler, a modern optimizing C compiler.
'),
('87', '1', '4', '
'),
('87', '1', '5', '
g++
           The C++ compiler from the gcc line.
'),
('87', '1', '6', '
'),
('87', '1', '7', '
cpp
           The C preprocessor from gcc.
'),
('87', '1', '8', '
'),
('87', '1', '9', '
perl
           The Perl interpreter. Perl is a great “glue” language.
'),
('87', '1', '10', '
'),
('87', '1', '11', '
gdb
           GNU Debugger, used to debug programs in many different languages.
'),
('87', '1', '12', '
'),
('87', '1', '13', '
gprof
           Used for profiling, this program helps you to find ways to improve
           the performance of your programs.
'),
('87', '1', '14', '
'),
('87', '1', '15', '
emacs
           GNU Emacs is a programmers’ editor and IDE.
'),
('87', '1', '16', '
'),
('87', '1', '17', '
as
           The GNU Assembler.
');

