Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F810481FB4
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 10:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158712; cv=none; b=UZXsKPrys8tP+7cEp2CgFjxPC6Np4h7RFxF2vvwKCRRofezf00ge9MQm302hSB2ROEgaxzy3NlxH4SHVE4yhLmtU+oNjNVBDmFIslb620LJ4LrFfhQUyGnGG5oiAYhTqZa1n9RcD86y0arqsL57MlP9vkvwUENybBoGqXO+ZKb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158712; c=relaxed/simple;
	bh=Cw4qUCgB4oS+hGjTirBsh6bImAzBppTQD9nONJcjvhw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=Fh8XEYo5Y8jn0WQfl68hxrrLz6JHEoNcZjPcZuWpIvmr31Yy0hFlfWNE/bvY7hv/jKW95kaevVNYGLY3sgjxq7Cy8laJKRCN3AvHx5+lOActYjZYGPE8cJD7MCIgHbcVDO29EJlYc7IkBdGFbKiA9U+BWqWaTfryjCMTXNHJBXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWfEnWSJ; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWfEnWSJ"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddaa08c890so3663625ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 03:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790158705; x=1790763505; darn=lists.linux.dev;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UkEzU1TrVb7LM2qKIN2UAZBeduPofA0aR00sq50xecU=;
        b=iWfEnWSJrPwSapVzBeAOdma7iaA0vB94vPNmLxKTsWxvmrs8o8Z8ZT7uDyCOSYrf3f
         7lWUxDwe7EYQUzfwEWkPD5hrBBjcvKngEfi2rhfih/JLsuPhflcnU7Mjv15zkDaHNfwa
         xrixf2ZtAxQDXE+RRYWElXBN7SssK+mVg/oesGR9PzHbW0oIb6NihQDJjsMhYBo/naSj
         JMxcbfDMM+zQjIMSZNI94VffkzG1Oj2DnfkOF3zorPf+gMGkC+XkIJUrBzc/A1j19nfT
         PrNA3Pw5wxD9uXufbV2N20vxf3e05o1LSUZkVWrR+YfnO4Tgqv1TzyzpJxuA3qtBeXNV
         69xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158705; x=1790763505;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UkEzU1TrVb7LM2qKIN2UAZBeduPofA0aR00sq50xecU=;
        b=htkpQs5c8SXKW++xBA/+YjY0EYXJgTRtU5pqYuvUL8el0ACQDf9gnE1BnWhySmh8JB
         dFV2P+/H0D4/hu2hNRHZteokN9EZ3seQoxYyGrB6xYnR6OkG40tdsRkPXmVnxyd3Wyu2
         uvTQ2dgCeSGhMr9stFHuShyKkVwY7iKv/VzUR+Mc2yfvDNltaNn8q1A3gECgY8Gz9dZe
         GBdwvHWDDuegYISV9yq7opLmlYmTCsoCRK7rRKLR1wllLJ942/u/LJmqQrjOP9EjWyHJ
         RcC2ns7k8il9VRrjbWtpzh9qZv/3l0IQTRh9nXJRvzYItXWx1OLOjx9C85byUOv3qL4K
         nkSg==
X-Forwarded-Encrypted: i=1; AKwUvBzuiy5PViDrImIZtCg3/ZNDJ935RNbe/eV+Gil793gYml8guQ8D6wbKhgrFpt+NKcPWMwRxMOS0fTeHq+vXutQ=@lists.linux.dev
X-Gm-Message-State: AFuF++kUJl+pMnZzUoPsH4fRLAexcI2pbJhjSWjGEs8h3z5Rrynyhgaa
	U6HkbsvJNK4OR8vRz1nglpV6qkwOVGhX2xr7Kmi7VpkshDjRnmatRO10
X-Gm-Gg: AYBFou2wzhHN0X4wd3iAK9+5FbV4gKU9KsKcHh6xNVYv3/RPeEsSA0mb/74pAAJCw5K
	xQ5T42O51+S3sF4jGEJmFQKcXKgyXunzfqS3u3qL/YPfhpaqJbSonCXmaeaxq7ElxbxgHzqRbKp
	eZ6FpGSgoAAvXaWW07WYWDG6biPJXiATJwb4pzQzgzu/cDgtyFC2g6wNAnHB3fjfowKaT0oeWQI
	fnZv9pYWO7lnpStENUGGQTPOCIvNRqZOVZOASENLJgczGpVCxcghwKKbNKZX9Q0eGzrRAIHys3a
	pz+lJa2njDmy1/oRakzm4gcX2g9/fUJC6Z1bGUxddC+iJu+Lnsu0TTk+rsLjYGYEjkq1P+89rh9
	UaPE5olOacPtCCwnQ2YwhDfw8guBDKFAhS9rKWbiz1lzH1ojCKtjZdT9z7A8Msx3kkwftlGwiMN
	A2kt1vCJQgO5WQho3UCJBel8ofTRO8Vxq0EASBnJk14Qk3063kK6tZeXV7z+bHGR0zMA4GDB7uu
	U+9etayH/0avofBvdk=
X-Received: by 2002:a17:902:f686:b0:2df:69e3:7395 with SMTP id d9443c01a7336-2df69e374admr18597665ad.18.1790158704340;
        Wed, 23 Sep 2026 03:18:24 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5a9516sm8289255ad.29.2026.09.23.03.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:18:23 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v6 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Date: Wed, 23 Sep 2026 10:18:18 -0000
Message-Id: <202609232015.ReplyLeeR7.lhw@gmail.com>
In-Reply-To: <20260923094539.GA3864833@google.com>
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
 <20260916104305.GM11487@google.com> <202609162015.RFCv5-0.lhw@gmail.com>
 <202609162015.RFCv5-1.lhw@gmail.com>
 <20260916122740.921E51F000FF@smtp.kernel.org>
 <20260916130602.GS11487@google.com> <202609162200.RFCv6-0.lhw@gmail.com>
 <202609162200.RFCv6-1.lhw@gmail.com>
 <20260916143832.520721F000FF@smtp.kernel.org>
 <20260917112840.GJ1605367@google.com> <202609172115.ReplyLeeR6.lhw@gmail.com>
 <20260923094539.GA3864833@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>

Answers inline; v7 follows as its own thread.

> What patch format is this?  How did you submit it?

A hand-rolled Python SMTP script, which is as ill-advised as it
sounds. v7 goes out with git send-email, so the format is the
standard one from here on.

> If the SCSI DH the right approach here?

It is unusual, and it was a pragmatic out-of-tree choice rather than
a design statement. The enclosure exposes a single mass-storage
interface that usb-storage owns, so a USB interface driver cannot
claim it without taking the disk down with it, and hooking the SCSI
bus from a module is not possible without the unexported
scsi_bus_type. The device handler was the one hook that observes the
sdev without claiming it, which keeps the enclosure a normal block
device. For in-tree the plan is the split mentioned in the v6 cover
letter: the SCSI attachment moves under drivers/scsi (notifier or an
exported attach helper, whichever the SCSI side prefers) and the LED
part stays in drivers/leds. Happy to rework the attachment in
whichever form you and the SCSI folks prefer.

> Shouldn't this live in drivers/leds/rgb ?

Yes. v7 moves it to drivers/leds/rgb/leds-asus-aura-scsi.c. It still
has no Kconfig wiring; it is the verified out-of-tree module posted
for the API discussion, as the commit message notes.
