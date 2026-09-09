Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACC43C3F58
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 07:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788937334; cv=pass; b=ELikr9fjxfT1KYMXbJnIws/bwsPq86s/pjf+aWMeQ6l7+tZIVMr47m/e23u9r1Ywzr6Q2gf82GEhp6p2wDWCAPaaTlnzw2vkg8rr6d8ikPQsiHZGTtgJDcBUM8Z+uquIUxbEfqPpfbDNu/SF1eDUaqI0O3HtR388vKoxuuUs0cI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788937334; c=relaxed/simple;
	bh=2J+vU0dHxTEM2Vn+6tCclkeUSsHDRRGywNVKfsL5GqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJviiZ1d5mdhilWj5VWRFUdyD2EUZCxGb70HOsFQAnptlx9gNUCk3B+bj8PKeyhyEdkf1vPmq+LjQ9Iu6WvuqzqX9BAgSx/EwXS0AUh3e9SSmWri4fjugfsEtZvzpYLaDd1QRHdzXxKIEJQCdtnhtsTFv0lmQh6GbADg3JLuVYM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fderbGWq; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fderbGWq"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-87ffa98d4a9so3312427b3.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 00:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788937328; cv=none;
        d=google.com; s=arc-20260327;
        b=pOYlqjLUxjKqAty1cSUNzyEeXL/2+Ms+PbYs39+CfFepxE/ApYtSVR6iyDX71IWDwr
         HxY/ZgQTGrf33WPvfNCCdaX5zQJCOxMbZwWPNOj4GLHYKLeMksTCY4Z/A+C05miN1DMs
         tm+4sGAkw6180dBbh8RfZE3x8ukpqhnY4C/6AwlTpGdgJ6kFE9jd7kI9pzCQGBq8+VjU
         PmS4UlLCENBe1QUr9QFM7kU/QXB6mvnCpBT6fGVgTo9eRBy2G/JcT1Ei67Iet0GWXc3l
         VuNQkseOk0UICfaamjtaPk8mvLPFSMNwPw2quvEBYj41/ITzPjNqP/DA0+KST/D2Tfyf
         Pvrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mtHcV2BeRJN7u2qRKVsV7oQ2/f0s7oaSuNmPDH3kCBk=;
        fh=Z7sIh60561IvzY8e3HWLghtEvTdpOYnl9Iq7566usbw=;
        b=M8qq7EyIU5G11VbZd9pbPH5GswoDtjsGsNG6pJwKIJsmeIGNC/iOIlBLGpQC4Pfp6T
         tbHYnaO73hfOoSW/kpVUYX8hDtOiLsSHZbj8mAigv4pfK8IhvrMpyDfXD73nFk0AX6+U
         pVElMizKAL3KEYOxaiGvfLXoiVi/pLaEpV15jAWguji3dsCtz3TSszxMsNsoNEgi+BhV
         hB+8LRT4ccLoLVFGaTeh5wKL81E+Q7swPL0qwr3bml8/WoIqRKKkkh+qOJBiQ0kuvU28
         sldTgILYSNdZTBtnrNScdDwEXWVzmAyPvgxQmqnH1bl1EKMqS2e5szRf2S27orWVD7Ql
         UYoQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788937328; x=1789542128; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mtHcV2BeRJN7u2qRKVsV7oQ2/f0s7oaSuNmPDH3kCBk=;
        b=fderbGWqGjbmlfvB4OouEQTsL+sVMbbTYKRq+7zgnpJlekIhvakBQlMUsBpH6DWvux
         Y4j9h1F8HDl+35s2NFr3rBEvlfhS1SlOhvZHbdN63ONtGymLya8nT/G+icsTGC3D8BfY
         CY4f1akfU9m/MuTQdJy3wQs/vCE3ZVN1Ib+j+C1aSGfhUq5n3zcpWNhjgRsA/2On6Ks6
         n4HeEtSWZrKTqqQlejP1zeHSCI7wzkXJJFJ20bSEdr8NJLuI+/DrEPjnAT77raay9lqg
         hnhn2IrDXThOzyiy3PvOVC8URpakhHRMpThOk+M8ICwuEY0BC3IH9TUFLvmIgpaLeXEM
         QYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788937328; x=1789542128;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtHcV2BeRJN7u2qRKVsV7oQ2/f0s7oaSuNmPDH3kCBk=;
        b=Mg5DVALtQOg02c9mLu5JhsSnI6VtGcyUGlJmpCL97R6O/o9+hEcNrW86KPZrh/mFnX
         hYKJQ9zYZw86b4fFKUGrcpId5vMLhGHC9QgaZ2SzbDS/vw6sjThfz5zzGwY544BQdaqS
         hkmhfelZYNxHt1LEpNcr0U2BseioXnGsN+KKiBXf7lfIkMZucXHqpo1NIH93QGJQs78W
         didLFZxI2iuzlGrug7/+kRRM1qov8xFabMniPmAJKg+YWNsUm6XWIrdYFlMVV8VPoEHr
         EXZp6fzeQ3SJrUbtPtyMvvIujHamQJ2RSE7d6Jb8pfEWYRusSnLGYJuUIRdIOEaHx2Ek
         dAJA==
X-Gm-Message-State: AFuF++l1bLO7GnFZT3McGURDQjTmAxKta4011VgiQajdkSOYkLIjB0E3
	3/dB/iOPphDH9lsxkyOql3nSra1xVlEg7sU18rP8svP3m5KrjuYAQNCxvTia2ySJ/enEoTwa3a4
	9eLPmpP9wnr4YqYtn5LrPJQjDLbJYr8FjUhXNq+Y=
X-Gm-Gg: AYBFou3qlAkJ8oBAuBDWUOJlcBBJQ+1fZKSrUxDBMsdwsbamJlJT343OA3lqA2UssWn
	QtOQ4N4wP2AXY4egZD294hOjJoMGc7pvBB7pSloVBG+0u1B5M+R1srP5m2V5Q7YcWh4/N6GklrE
	FSOiCmDmPl4LNqpJMvh2OBAXFF4ajEmYzgZoh2txklxUqm8/aDKhA7CrWYeP/dIvHLZxMdLwXQW
	VYmR5e4/cT5qXVTJa+VBmKHLREvuqGlclnY6tOet0uqDdrA0MVjaMIUYnmy2GNxl5ERbGqK+WOC
	eXK5rT38u+DLioYQd56c6xFU7GS8Gol+AeFvfBK7PiS9K7KWgu4YC5eGjBD1vC9p8smZXIAA/NB
	wL4o25UeOnZxx
X-Received: by 2002:a05:690c:15:b0:873:5bb2:6bfd with SMTP id
 00721157ae682-8735bb26dafmr96729107b3.39.1788937328146; Wed, 09 Sep 2026
 00:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909024324.16002-1-laoar.shao@gmail.com> <20260909024324.16002-10-laoar.shao@gmail.com>
 <20260909025604.14C2C1F00A3A@smtp.kernel.org>
In-Reply-To: <20260909025604.14C2C1F00A3A@smtp.kernel.org>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Wed, 9 Sep 2026 15:01:32 +0800
X-Gm-Features: AcwNN1VAmTZpGCZaes0KAMDlEawTsQnOVz10d90Gk4r_1ogB0jj3Jg4oDnaUcTo
Message-ID: <CALOAHbAQQ8odjtyYjGvzPF-dYT61tYgOHpW_nMuvcRxtjzeC1w@mail.gmail.com>
Subject: Re: [PATCH v8 9/9] selftests/livepatch: Add function test for provides/obsoletes
To: sashiko-reviews@lists.linux.dev
Cc: song@kernel.org, joe.lawrence@redhat.com, pmladek@suse.com, mbenes@suse.cz, 
	jpoimboe@kernel.org, jikos@kernel.org, live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 10:56=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The test fails to verify its own claim that a function is func=
tionally unpatched after an atomic replacement.
> --
>
> commit abfccb0026870ac46d37d3802586498b0874cba2
> Author: Yafang Shao <laoar.shao@gmail.com>
>
> selftests/livepatch: Add function test for provides/obsoletes
>
> This commit adds selftest scenarios for livepatches using the provides
> and obsoletes features to ensure patches with different provides IDs do
> not modify the same function. It verifies replacement and coexistence
> behaviors for different function combinations. Tests are skipped on legac=
y
> kernels.
>
> > diff --git a/tools/testing/selftests/livepatch/test-provides-obsoletes.=
sh b/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
> > --- a/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
> > +++ b/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
> [ ... ]
> > +# - after the replacement /proc/meminfo is no longer patched, while
> > +#   /proc/cmdline is patched
> > +# - unload the replacing livepatch, then the replaced one
> > +
> > +start_test "different functions, atomic replace works (nops)"
> > +
> > +load_lp $MOD_MEMINFO provides=3D1
> > +
> > +grep 'live patched' /proc/meminfo > /dev/kmsg
> > +
> > +load_lp $MOD_CMDLINE provides=3D1
> > +
> > +grep 'live patched' /proc/cmdline > /dev/kmsg
> > +
> > +disable_lp $MOD_CMDLINE
>
> [Severity: Medium]
> The test documentation explicitly claims that after the replacement,
> /proc/meminfo is no longer patched while /proc/cmdline is patched.
> However, only /proc/cmdline is checked during this sequence.
>
> Should there be an additional step to grep /proc/meminfo and verify it
> is functionally unpatched before disabling the livepatch? If the atomic
> replace logic had a flaw that accidentally left /proc/meminfo patched,
> it appears this verification would be missed and the test would still pas=
s.
>

Nice catch.

I will update it with the following change

--- a/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
+++ b/tools/testing/selftests/livepatch/test-provides-obsoletes.sh
@@ -545,6 +545,7 @@ grep 'live patched' /proc/meminfo > /dev/kmsg

 load_lp $MOD_CMDLINE provides=3D1

+grep 'live patched' /proc/meminfo > /dev/kmsg
 grep 'live patched' /proc/cmdline > /dev/kmsg

 disable_lp $MOD_CMDLINE

--=20
Regards
Yafang
