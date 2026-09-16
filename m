Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749224BC00B
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 12:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560937; cv=none; b=VSP+XU4SWVHu7KFbkLN1g0B+PPR8O+ZjY40PSHal/loD3sR8KnfTH9vFicrwzwre2z23WIZ3K+8LNIpwfrZWIta7xBIG+BnQawpThTTk3vv0VBMHyRu8Tug8ZLTdqxu2CCc4I+B3w/OYOs3mdU4jWnsmMeeHCb4UiqgbSaCB4Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560937; c=relaxed/simple;
	bh=mKSCs4efO4oPsuBT2TQVVQpT0G+dF938WzWWznsLPTg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=hi4voBA/QIall9FkaX/j7wWHWUGmaZ0zCJoclbWD5UqJ5GBfkh3yXA/BGZQDLzXUYsl3xV24xGpdRBQeArH5XNqLL7H0GpdYbzkSMOwzjeZyUeISpFSAN7Qe3QLA/kNpP7Xnr/Mh1oEiDWXo8R3lqLlf7TqAf1nsZxxE8WnuGQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fMcTZNz2; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fMcTZNz2"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc502a179c1so1144284a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 05:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789560935; x=1790165735; darn=lists.linux.dev;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mKSCs4efO4oPsuBT2TQVVQpT0G+dF938WzWWznsLPTg=;
        b=fMcTZNz2QjaHFJAHrde1HeeVx/qdXytgfNKy7OSGRgzQjKS6HBpDI/vQ4fZ0RIhX/m
         Ql8HBR2d1xBglL3pqoHH+aj+V/mR2l1mJ//e0fWpArRnGGEAAssmuRlRjB0ruNX19+S3
         lsGAA9FWQ0J4AzOODfGrjQSyzwTkCZE93Ns0xO0RACmHhy3wOX3a1pQq1KUt5ohRlguG
         KHV7f5on/SeM7C836LxHKC/HCCxZ1027+2ctinRPM7ihysZy3yJymYP3Y0O5po/v/oL7
         QgdQCpIGioW1tnkl/DuaHPbx3XxCHSxXU/S7itQzA1foypQBsZSDXN6wZrEwbppVgVnD
         xvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789560935; x=1790165735;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKSCs4efO4oPsuBT2TQVVQpT0G+dF938WzWWznsLPTg=;
        b=lDTQVWPcEaqo50laQfxqbx0PbS/5Prm+aUGvv26+D1icGCTZwZ+HZNQEUID1o5/oNb
         RuJlzrrMOU1tZ9YV22liVPizDC8ZwEfhl3d9Tv79RNVmXfFzVD2VbS/qmRa1e65tfldn
         60X/GuRofAYxDs8OV5Q2uK39aJfOKUwqwFzuWBEXKvuWgcRwulVUemBhQ81aYZmuG+6l
         FR6zqdfScYGQ2XuU/Gt+CbMFGWOOejI/uhCpcZ8a1FcxJmvQ6Mo39o+WFQ1p0RkCVfnv
         3oDa7OZpgK1NIclsRN+mLh6Sy4FCXgNLdS5UXsjGF461R2j9MnSuQ/er6jtBDijiuqsG
         eFog==
X-Forwarded-Encrypted: i=1; AKwUvBzaZutwT8QJUq8hOoQjQ7GAvgLWxryGn7nkbV/I2uTskJiTgtpLngUhOaHhLppoWT/xfct3IuFTbuJyWWQ02KE=@lists.linux.dev
X-Gm-Message-State: AFuF++knx+mqmW9kRgqoJDBCcFwMCoxwXwIq7FX64ePBSMe4h5jhxe3M
	r0cZ+vQ7ZrttLcPs+xFhcP0il5p7FvK/m+9CnVCpCja53ykNHDlId4aw
X-Gm-Gg: AYBFou1AmZGRF4Pk5JxhT7ascmI/ylvJx+iio9m4JiWeLL8MYiH/qxrIzs2UHVMjlyY
	5S+lKwJLZH97EfF3V4MI+fCtN0FD/sA/tozk0mekYfKhUBdtdJvqxelnguQNS1kvcYPLzQwBLRI
	3Vvv/hcFp0y8UBCp892KMwTU2ElcJvnm5AAZyTk9oMJaKhKOqXcoKJmDIQzA9aWluOKjqceCkS2
	/HDJDGqhW29Sj+zXwHkJ7JmXz2PsZnXoME5TTaK1L/rdm58Lmws5ctsKmf12zmODue9pAMj+mJW
	KEDPzoTSL60Co2WLVhfN2XcLgAJBgVmDtvHDbdPlQ4YS6Sm9BmkF4z7a+muaSni/adOB1rPjmEj
	uP6hI2ieyxUosBAnaiNKInOiWBInPc83G/acXW3E4DF/5pJjHIa1jh2qQfXeOfDqO+DSSgPq2VL
	8eRGYNzv2wgdT0BuFfvbyvpEN4R4K04FBgPzae1tjHrTCZsxI1N0K+NE+lUhAHuK3A43Xbaw==
X-Received: by 2002:a05:6a21:6da4:b0:3da:eff0:c162 with SMTP id adf61e73a8af0-3db4fa37105mr11544412637.6.1789560934398;
        Wed, 16 Sep 2026 05:15:34 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50ab8ae01sm1512489a12.18.2026.09.16.05.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 05:15:33 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v4 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Date: Wed, 16 Sep 2026 12:15:31 -0000
Message-Id: <202609162015.ReplyLee0916.lhw@gmail.com>
In-Reply-To: <20260916104305.GM11487@google.com>
References: <202609012200.RFC0.lhw@gmail.com>
 <202609012200.RFC1.lhw@gmail.com>
 <20260901145204.2BF551F000E9@smtp.kernel.org>
 <202609032000.RFCv2-0.lhw@gmail.com> <202609032000.RFCv2-1.lhw@gmail.com>
 <20260903122408.3CA6B1F00A3A@smtp.kernel.org>
 <20260903161357.GX2133376@google.com> <202609042000.RFCv3-0.lhw@gmail.com>
 <202609042030.RFCv3-1.lhw@gmail.com>
 <20260904131503.355C41F00A3E@smtp.kernel.org>
 <20260910093232.GO2133376@google.com> <202609152112.RFCv4-0.lhw@gmail.com>
 <202609152112.RFCv4-1.lhw@gmail.com>
 <20260915130050.E8CDB1F000FF@smtp.kernel.org>
 <20260916104305.GM11487@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>

On the three sashiko items: the Medium one was a real race.
led_mc_calc_color_components() writes the shared subled_info array
outside the zone lock, and concurrent brightness_set callbacks for
the same LED could cache a mix of each other's colours. v5 moves it
under the spinlock; v5 goes out as its own thread.

The two Low items are false positives, and the same two the bot has
now reported in all four rounds: kzalloc_obj() has been in
include/linux/slab.h since v7.0 (this driver builds against 7.2), and
blk_rq_map_kern() takes four arguments on current kernels, called
exactly this way from scsi_execute_cmd() in drivers/scsi/scsi_lib.c.
The five-argument form it keeps describing is from older trees. The
bot's reference tree looks outdated; can these two be retired from
further rounds?
