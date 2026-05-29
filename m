Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600A3392C4B
	for <sashiko-reviews@lists.linux.dev>; Fri, 29 May 2026 17:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780077520; cv=none; b=Ng98I+Qf0kclIC5OiRIoAJHw2rJ8sSlH5UEBozR5rCoj8MdfxKxwREMxk8YXC6vDFxTe87nzP/Sep/HQ3AKclFhgCa32hrJJkbavB5uQE4d19iOIKM8Ba57+SVBg3wxqGE6KGg87JCgRrclIKxHYDucmBYg12ZmoUHVMMrL8R7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780077520; c=relaxed/simple;
	bh=DfK09CFR2aqZOgvAcChRMsru4L9ZPV0hljybfT1qh70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImLuPGaD4/LNtQr0srjmItDRoF2brS+VFcHp/oTJ0A+NTucMtaziLY6EEmoUGvqmQrwQaqzMOLdkmMMjfJ4XiURRSK8MmGJGdUN1HH9Qf1tz34YMLZKaZMRu5/KwUm5eMe9ntWO4Z61FXcsdYoEOxZkFM/udGwJ2MUzRhLHqqKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Vzy1Dd7y; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Vzy1Dd7y"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TH1C8T2419225;
	Fri, 29 May 2026 17:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2sFc99
	fyPwa+RvXKShdgaE6DRvYhurpgmVemXJWbkIY=; b=Vzy1Dd7ytt0E502ZEHXYB3
	EZ4JqWIDbcqgNEmKRuA2cUfdqptTBHoppaXb79PoSxE4+4qdg0yCLxZq2hHDtgVx
	97e0FuL/vLvhFiNC4AC+IAmH5WkGg0Ofj2fjcvackRE+etL1yRR7+hpwNiViEWsU
	bqt9tViOrHxf0gQLgXExnQIu8XNYZVwYN4UQ9CSz81bSY/hu7BLTUijh5N0oQMjq
	bJp2aMA9dR1fB43SWTjVKQ8YimahW4pyy1LxpDL7CgBA5d41uO74tiYjtQRAxpvq
	qtjAE+MvNGEUmzgw+TVsrIoWiKmk3z+euBB5w111dcLAfcUDjs3cZecuXs2J4nIg
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ee884xv5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 17:58:33 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64THs8BU012533;
	Fri, 29 May 2026 17:58:32 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4edjrc1tb3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 17:58:32 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64THwUrT41746934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 May 2026 17:58:30 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9027320043;
	Fri, 29 May 2026 17:58:30 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A7A020040;
	Fri, 29 May 2026 17:58:30 +0000 (GMT)
Received: from li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com (unknown [9.111.19.18])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 29 May 2026 17:58:30 +0000 (GMT)
Date: Fri, 29 May 2026 19:58:28 +0200
From: Jan Polensky <japo@linux.ibm.com>
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org
Subject: Re: [PATCH v4 4/6] rust: helpers: Use __builtin_memchr directly on
 s390
Message-ID: <ahnTxJVPxljUDVmf@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
References: <20260529145752.1209016-5-japo@linux.ibm.com>
 <20260529161748.0DFB91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260529161748.0DFB91F00893@smtp.kernel.org>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=L4MtheT8 c=1 sm=1 tr=0 ts=6a19d3ca cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=iQ6ETzBq9ecOQQE5vZCe:22 a=c92rfblmAAAA:8
 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=_cFRgl7zeDfO8rknsJMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: 5XWvuPj-bBBLy5A0S301KJY4gjsiu_G7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE3NiBTYWx0ZWRfX7y6+BHCPPv7y
 P3jyDcUac88dQ2sNkwK6zIHc8wbODKQcVSL4ddaEVRsWMFLY6lF+RkQnJVtPDcTvVk5UkXzyBxU
 djOF3UJl3lSqBE59bxXMN8pRhBRTk23oBmw50sEr0x4nJdxnAzacotCsHyGweHCDLf3Q1PeB14M
 cE7x0wMl5y68XUGa94COeTPxerwBRRG/HgzG607Fgzg+cUM67dB4MoMRDJiXg7pwvcnAYUXTIPh
 w75rlK4dTorxVuw1iCpqfTypBJFFLRqkTtg8Y5zwzJ2dv3Jjvhq8uyNgLiUQO8KFtMDHx8VfZts
 IND8LvQDhqwgBaVhDlQsOZou9nEPpg5Tfh5zx3lHQd/nrzy/w08WPyuZsKVKYe1JdPEcy2DBFd8
 l5vhq4XhdHOnJxt2s1Yc2YmGjN810pfU4YaXzJr4Pp0DNu36IDdnWLS99OExyHEvL4Q+PKRcy0A
 QoGP/mUpLpkL+nQYvOQ==
X-Proofpoint-GUID: 5XWvuPj-bBBLy5A0S301KJY4gjsiu_G7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290176

On Fri, May 29, 2026 at 04:17:47PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Using `__builtin_memchr` directly bypasses KASAN and FORTIFY_SOURCE protections.
> - [Low] The string helper `rust_helper_memchr` is misplaced in `uaccess.c`.
> --
>
> commit f9c3292d90fac0677f3db0961507b79ecd8d9bf7
> Author: Jan Polensky <japo@linux.ibm.com>
>
> rust: helpers: Use __builtin_memchr directly on s390
>
> This commit replaces the implicit __underlying_memchr macro expansion with a
> direct call to __builtin_memchr in the Rust helper. This is intended to fix a
> build failure on the s390x architecture.
>
> > diff --git a/rust/helpers/uaccess.c b/rust/helpers/uaccess.c
> > index d9625b9ee0466..d4107426003e2 100644
> > --- a/rust/helpers/uaccess.c
> > +++ b/rust/helpers/uaccess.c
>
> [Severity: Low]
> Could this string manipulation helper be placed in a different file? The
> uaccess.c file is logically designated for user-space memory access functions
> like copy_from_user. Moving this to a more generic string helper file might
> better maintain subsystem separation.
>
> [ ... ]
>
> > @@ -27,3 +28,9 @@ unsigned long rust_helper__copy_to_user(void __user *to, const void *from, unsig
> >  	return _inline_copy_to_user(to, from, n);
> >  }
> >  #endif
> > +
> > +__rust_helper
> > +void *rust_helper_memchr(const void *s, int c, size_t n)
> > +{
> > +	return __builtin_memchr(s, c, n);
>
> [Severity: High]
> Will hardcoding the builtin bypass KASAN and FORTIFY_SOURCE protections?
> The kernel provides a safe, instrumented version of memchr that includes
> bounds checking and memory safety sanitizers. By using the builtin directly,
> the compiler may emit uninstrumented inline string instructions instead of
> calling the instrumented C function, bypassing these security mechanisms
> for Rust code. Would it be safer to use return memchr(s, c, n); instead?
>
> > +}
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260529145752.1209016-1-japo@linux.ibm.com?part=4

This might be a better solution:

diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 625921e27dfb..592b9bdb4e4a 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -88,6 +88,7 @@
 #include "signal.c"
 #include "slab.c"
 #include "spinlock.c"
+#include "string.c"
 #include "sync.c"
 #include "task.c"
 #include "time.c"
diff --git a/rust/helpers/string.c b/rust/helpers/string.c
new file mode 100644
index 000000000000..d04340dc9139
--- /dev/null
+++ b/rust/helpers/string.c
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/string.h>
+
+void *rust_helper_memchr(const void *s, int c, size_t n)
+{
+       return memchr(s, c, n);
+}
\ No newline at end of file

