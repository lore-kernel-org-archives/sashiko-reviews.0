Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794557484;
	b=2aeADuaNjARKQEnmiqjpnWoxi4UjWzVMxiZv9x3JopbcdU0SIvES/EsCsuenWjXQTqtG
	 cl9Nv7YNitagRYAYRogOuY9sLOQ66DIzGyeGze4umsHc8U+hQiuvc40C4y1hf3lbe99Oo
	 wCJypCCl+APj58QYQdpMaEvnl5+fkL/RMsDtgDcxDnyoQDfc5vuXFs7OW3WeQYHfn5B7c
	 9CE6rfDzsjmUNe3pzCMmmfzbu093LMNZy9SKfjUmeliTNDEgHBMNhmNX7R+ijYZ2ZITls
	 WPD4dieTZm8ebrpWg2bKnwqW8K0DZeD8gep+2/Fcesfu8+axfFqDkQfePP/xEZajJ1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
	b=svAONbjPgZOAJFiCctsXP6FlLBiDEpeXdcnQWvRUeomp/4o0e6GXos8UaopGowSyymRd
	 SmfV4KW7G9rUJdyv7FaJgtPPhTDOZLprOXn+GmgW5i2lMpAVNZWxSa6uqJCOY/LhM+3eV
	 Pv36d/BlZ6mz84Mo/smaBA9HZa+3xBHs+Pu4PxH0agyzY4o2KR9BKYlFw01KqD3/Dd6uk
	 wYfehwGsKAleAS7oqMKtPuAMiT9iAZ54d5Z8yhrDif4PZcwL/sL6gBvsV8M+NYn5iT5rN
	 wVZnmkK1mLWAfOVUNqvgW0vpeYnur1p9jjsW26Y41cA7oGoHSeIfZkkUYNqfz+ed3qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloud.ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=J2FIxeiQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4806B606A327
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 08:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4806B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cloud.ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloud.ionos.com header.i=@cloud.ionos.com header.a=rsa-sha256 header.s=google header.b=J2FIxeiQ
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4cd28978b8so12029266b.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 00:11:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794557482; cv=none;
        d=google.com; s=arc-20260327;
        b=U1vQ48TqEO+3dXbAFHcmtjg9D2Xo+SJJW8Qr81Bc3sDkUSZbjcy3nceyyup9yefIys
         +JmTXxTZxXrKZN7YTFJYvWJOSthU8tCBIiUXHqGx0Rcp66BKERgE/hjH8PS05oJG8MfX
         K5tv3L4UMcoGBw0qpBrLJE6OuzP9vzKGGToOCWWVIn3s//Bb+59J6LvVOypPPqlppv/A
         EItSpcZVq81m5PEB3qhRpfhUBkTl9NUzPinLUbCtzXMayaMLMl+4IPLdGjHgF8Lq1iSV
         p9AFqP6rPsLnau3L1RjXDpP3QLqp64IeioZ+2zFnnHocdRQ9rPw1LsG9oM4lQxuioh8X
         Fyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
        fh=EVogjaFqD8Y3eOL2m6anHFaQr/MmagkSN7RA3UisQ+Y=;
        b=JeFRVsS6cXh+bF0ErQDC3Xci4UxV7aWRpUbWQkTc0wJa8OCnNnIoEsgZxIfp78SreW
         8v0SzZmvxW0BB6+giCECtxmOBn/qQniQB8ES76xQgkzzSgqfpj9DsknwyF4LPR3GlMZr
         Uw7ReLnq3SCE/BF580rNU7roHM5VvvWAQgPeOOuTQWGRp8/pvqrJk5xf860hYI+nFLWf
         iY1xIfoEiMw+2eNXOgC4WSa7rF0pz6NSNzlSBubx3gTm3a1lc8ItfMD39iKS9VYpsPlJ
         P5Byw1RyVsATi7RBJdnju03yNSiP0F5sEhOcVNHyrP9CCfEQbUFHPQphntbtC51yYFS7
         gMMg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.ionos.com; s=google; t=1794557482; x=1795162282; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
        b=J2FIxeiQOVoY1mUnkbQsJzd5VX+sWHHTlUL/HtH+fwxDOW+MXpZCP3aNjrJdq2zQGM
         E999O08vhoaWHk/e0uEwXJc8MscNWi3zca19F7L8FwgtPRHX3CX/3FZXLepQM/sVU39u
         a1eI3mK4gVEwscEJloxh83YeCgSRwPNeqUTgkkMV+2g16dg7Gg0s4YBdq55O9wdrlLKj
         Y2xOIavYfHLIh+jYhBKx4b0XaRVBhHFNCLue+uXJV8eoGTZoIkV9qoa7B9KKIW+RNgtA
         ZBTs1u7eiEC1SZ0RAr6AVGAJGne7A+7rgW1Uvy9GbAghdlWBxyGhlTUn8IrMMJTL+JIe
         nvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557482; x=1795162282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ky1fNcYST3cXVSIleurQJpPQOjWYx5UwkSzn2L6E/3w=;
        b=hdxe6zwTqqs5mmJ98E3H7m2XXlm0cWGasd5wKWItSdBJOTUYfhJEPZgU1OxrjSj5re
         mjFFRN/pxQh9vYjm0nPxgcKOf72K/xAEp2bI0HD+gp+Jv1Z1k4YuMrVCgGUrIup0BB3s
         RAPEHFUIFRseoiAMmy809oxqdpppeXIKsuRqUNFD6eew55vGU0S+8P5hkXIizcSs4/nG
         ssJ3hxW4xnbYWSKfTNWTbRFSCPHq9UVfL5+4q607wRhA4L6CdmQf6xW7YjqTzHgCqFET
         23i7e8qPDZ0iOGT3MMY/paKsfjPefSusuNBh8E0mpZQvvYodBGgIEN0YqUnWOOM6k4pP
         /T6w==
X-Forwarded-Encrypted: i=1; AL+hErHqZIZlzUQ0KFzU47ouVJqehgmmzrwsq0IBMFk1GiYrwz849KA1Ao8LRs0S3uUzAZcz70M/nyg34nSYpiOSfoY=@lists.linux.dev
X-Gm-Message-State: APuU4Z82VqezMR3Ua5yc9PndEUQvhPO+Np2kvMD78mazadRcyh6Afssx
	/J6SVcEiBEGnhldu1VHlTuV62ogFAKungbHGx9ZN9VaVEe3NcsUD3rmQItJ7HJCY6djltDb8FXO
	Csnfvo57xSleSOn/ZMzhpbucdntpu6qG86Z7WF9/mPA==
X-Gm-Gg: AYBFou0NAZrfDHBq8jQr9Jv6Pa5hALad0r/6L/TwTdOo2IB1DyxKsHKrfFWfenHcdVp
	J+t/SQ2K1jPSvW5rkNXwkcNh28cpf/AwnaIpeFhhx/xNGu6vz/z6GvFfQsasdMZsQ3JVPapoHfX
	SewHzsfTR+KZJZxzgvSoDned+VbPq3O2cjGfJq41no59hdiIa17I33F897A6+ex9dFaztbXvXok
	Xms6FF2OQTphlTsBU4RqcJKP1Uvq9f/KLXKNMFxF8Z8Dbn6swqlJLT8baCVE2a48ObGgvZ1g5pn
	Mo25tQzgmbEmJ9vwRB1WuxhoGTKCPxKlc+o/ytJWO0pkTXTk4JTJrIrxIQWh4BBQi60KPjEMh/i
	E1TFDFnEn+Yde320MrciGMBpCDu3S8TuN89ernZeOys+Hm5CSF8pbz7TOWaNEoY2sY2IrYQ==
X-Received: by 2002:a17:906:f183:b0:c2e:3698:dbba with SMTP id
 a640c23a62f3a-c509642ceeamr126451666b.4.1794557481497; Fri, 13 Nov 2026
 00:11:21 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261112134700.372702-2-jinpu.wang@cloud.ionos.com> <202611130354.oOiDWpa1-lkp@intel.com>
In-Reply-To: <202611130354.oOiDWpa1-lkp@intel.com>
From: Jinpu Wang <jinpu.wang@cloud.ionos.com>
Date: Fri, 13 Nov 2026 09:11:10 +0100
X-Gm-Features: AclHuK_ijeVtZl53-Nr24xIboJn-g0mWRkSzGcLkYkpL9J_f9DfqfuDTwKSOTUg
Message-ID: <CAMGffE=bCVxcuDzUdGk=btfu-bdHhwofHQ6qkgx7UmQTpvSyhQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] block: suspend bio based disks around queue limits updates
To: kernel test robot <lkp@intel.com>, sashiko-reviews@lists.linux.dev
Cc: Yu Kuai <yukuai@fygo.io>, Song Liu <song@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	Christoph Hellwig <hch@lst.de>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Li Nan <magiclinan@didiglobal.com>, Xiao Ni <xiao@kernel.org>, linux-raid@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, all

I will fix the __releases(&disk->queue->limits_lock) annotation in
next version, will wait a bit if any other comments.

Thanks!


On Thu, Nov 12, 2026 at 8:18=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Jack,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jack-Wang/block-su=
spend-bio-based-disks-around-queue-limits-updates/20261112-144659
> base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> patch link:    https://lore.kernel.org/r/20261112134700.372702-2-jinpu.wa=
ng%40cloud.ionos.com
> patch subject: [PATCH v4 1/2] block: suspend bio based disks around queue=
 limits updates
> config: arm-randconfig-1002-20261112 (https://download.01.org/0day-ci/arc=
hive/20261113/202611130354.oOiDWpa1-lkp@intel.com/config)
> compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 1=
b1fed44d3dcca649a9877915d57c3357a98124e)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261113/202611130354.oOiDWpa1-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202611130354.oOiDWpa1-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    In file included from block/blk-map.c:12:
> >> block/blk.h:680:10: warning: releasing mutex 'disk->queue->limits_lock=
' that was not held [-Wthread-safety-analysis]
>      680 |                 return queue_limits_commit_update(disk->queue,=
 lim);
>          |                        ^
>    block/blk.h:681:9: warning: releasing mutex 'disk->queue->limits_lock'=
 that was not held [-Wthread-safety-analysis]
>      681 |         return queue_limits_commit_update_frozen(disk->queue, =
lim);
>          |                ^
>    2 warnings generated.
> --
>    In file included from block/blk-sysfs.c:14:
> >> block/blk.h:680:10: warning: releasing mutex 'disk->queue->limits_lock=
' that was not held [-Wthread-safety-analysis]
>      680 |                 return queue_limits_commit_update(disk->queue,=
 lim);
>          |                        ^
>    block/blk.h:681:9: warning: releasing mutex 'disk->queue->limits_lock'=
 that was not held [-Wthread-safety-analysis]
>      681 |         return queue_limits_commit_update_frozen(disk->queue, =
lim);
>          |                ^
> >> block/blk-sysfs.c:909:3: warning: mutex '(kobj - #undefined)->queue->l=
imits_lock' is not held on every path through here [-Wthread-safety-analysi=
s]
>      909 |                 blk_disk_resume(disk);
>          |                 ^
>    block/blk-sysfs.c:897:9: note: mutex acquired here
>      897 |                 lim =3D queue_limits_start_update(q);
>          |                       ^
>    3 warnings generated.
>
>
> vim +680 block/blk.h
>
>    675
>    676  static inline int blk_disk_commit_limits(struct gendisk *disk,
>    677                                           struct queue_limits *lim=
)
>    678  {
>    679          if (disk->fops->suspend)
>  > 680                  return queue_limits_commit_update(disk->queue, li=
m);
>    681          return queue_limits_commit_update_frozen(disk->queue, lim=
);
>    682  }
>    683
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
