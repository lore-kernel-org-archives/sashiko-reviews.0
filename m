Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BF84915B7
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 19:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895553; cv=none; b=sVOFBywgzz7q0ykRceCu1FRG5cj4NlImc61cBkUnf4/3uMPmsk2b6yOJYFLbAuBLx0KdjPduyAt9nSc7wkQW3ntvU2e+nlpsu3kNFhskeA8aI0pz9tQjepDOzKzEX3r4aOTR4Oo74siCGod0cBcfeHUnoek5aKtjE1dUi7nlNhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895553; c=relaxed/simple;
	bh=f/QI6fQPpYfaZdPpU8xWGiSPyzZLkdoD/NBWjln+Vyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDprk3oPiupg9LY8KhoM5+n4GT96Cz5uXu4a6GrYhv4DkF43mJzQ2QpQV2C1KWEwY0vvmyrn6WelMrXFxo0UaPFl/R9cQe8cvzD7YU8cQQRr03o+jz41AC2zo4PoC9eJIFmhnQ6IINAzd5Hm3jHUw4i97TV88guwvfkOWMC2HT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A+KFR7wU; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A+KFR7wU"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so613696e87.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 12:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895548; x=1789500348; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qs8C9B+WUBDgq8aRTUIEYiHOvCr2S97eqgKrz0PamYA=;
        b=A+KFR7wUCmWWQZgmGMGJNRy1WDoSxzfIQp4GhwafDMIuXFtKoS9SSCtZYtNth/ccKa
         UBvbyGNomv8QRjJT7pIK8+mcsmLIoJHzw9hctyfn4iNEjKUkpBK3EToIGiyrQEmdzz8Y
         mAcbw9dYGYUI6VagB65xVRe3DSSK/FqK8vV2Wuarbs2w7hqwKeJ1BKxtMvAf1h9FiDrL
         4GZmSUAw19G5oQqShyH3wWBzaXbfGRQKu5GLZfBlCpKsWst19vEX0d2ty8mhQu/O5fYG
         OZ0Ke+txmrhIg3HVetdvtWvH9RN6WHJUqy6c964z2e41I05ULS1cgg+g8vETLeOld2kW
         f59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895548; x=1789500348;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qs8C9B+WUBDgq8aRTUIEYiHOvCr2S97eqgKrz0PamYA=;
        b=K56Xd9tVPXdjKfQvaszXle1DVaUzqzSEMJkjqGHgPBuA1V9rI1XWQkNnHMOKMVpbKx
         tb1VQJkwhaST0sOuOTPNXj4K5exA8MQyQqmadTq0tjK07DZwdAX7fngxqF+kh3hNQUHd
         Bi9+pKckjhp4tASPoLDsYQ50aW3cJFgmUYa0A3wJkUp6ONEvXUpX8RkPiQziyYajxZAn
         hWIJQGGxaYZJvda9Qq1kwp6SrNMmA0txr0wbicSeOlGIkNfKyzdIS1fMeEx2E7ffVFBf
         TgMp/5REbMi7bwy5/S498ntaKHTHrZ4rlO+PMuufNpeMQhuPjZsOH/2b5fKh7v/awjhT
         k01w==
X-Gm-Message-State: AFuF++lXWji++ERTERfdH8C8z5BYm+2xkUvcJff1Msr92LXaD72NHoVz
	gIb062kjR3+B+IiYfcWAeiyl0AV8f2bBJpmXQfKU4LPjEYPlyWap3pxCp9F5jGNsGBc=
X-Gm-Gg: AYBFou3U9RuJN9LDlQIvwlujhXSM/s+1bs6Z/I/5xDu6p0RX2gpkKQEJrR9y/1r42B7
	V7+0/xGzqniNgOVzBv/eKDzseeTRVk0D00mETwM1dLVnkFpZstlle83ufrH9vHDc75zqRHeggTO
	AndDFunrkjQ/GX+zzuspXTPhAD3nNQLVyBfPptHzRBtVAQ3+MCqXQ5Hsb6XvHHyECdksaI4KtLn
	kKbZwnTDO/BY2ccAMj4eVvSgItLjFIF/xZ+Qyeq06XsS2216+IbX0eZwJwglYbPEV0XPuoWa0OS
	XygcIc0wtZRmw2bx0MYw2Ow50cfXSyOH3uVQLsppdaURaa86jWz9GD515MWg/b1O3XAGI3Ce5gE
	0oqugeQef4IHWmbDwBt5fLbd20yHIrq78Upu2f4LIUVDIEsT1jKUuyzpvi4fQvXZ1pQAkD2s2ju
	jlN78YIRUtm8cWWLqeZJtrqJkGrzMS9uyvEaGNvz30usvCZN4eHaBRnYlNHvlK1YkI+abNfz3+P
	hk=
X-Received: by 2002:a05:6512:3b96:b0:5b6:10bc:b867 with SMTP id 2adb3069b0e04-5b75c926908mr1490072e87.21.1788895547733;
        Tue, 08 Sep 2026 12:25:47 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166f6ca3sm3289156e87.32.2026.09.08.12.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:25:47 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:25:46 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alice Ryhl <aliceryhl@google.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Mukul Joshi <mukul.joshi@amd.com>, Felix Kuehling <felix.kuehling@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Manuel Ebner <manuelebner@mailbox.org>, Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH] rust/drm/gem: initialize callbacks with
 ..pin_init::zeroed()
Message-ID: <aqBf1UYNR-Q3T-cs@soda.int.kasm.eu>
References: <20260908175427.47207-1-klarasmodin@gmail.com>
 <20260908180555.0830E1F00A3A@smtp.kernel.org>
 <aqBX1siwtKuBTXBE@soda.int.kasm.eu>
 <aqBdJY43QlnN5wnx@soda.int.kasm.eu>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqBdJY43QlnN5wnx@soda.int.kasm.eu>

On 2026-09-08 21:09:40 +0200, Klara Modin wrote:
> On 2026-09-08 20:57:05 +0200, Klara Modin wrote:
> > On 2026-09-08 18:05:54 +0000, sashiko-bot@kernel.org wrote:
> > > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > > - [Medium] Incomplete fix: missing `handle_free` field in conditionally compiled `shmem.rs`.
> > > --
> > > 
> > > commit b5b83bb373847c99ca6d286c268d2e0ffab299f0
> > > Author: Klara Modin <klarasmodin@gmail.com>
> > > 
> > > rust/drm/gem: initialize callbacks with ..pin_init::zeroed()
> > > 
> > > This commit updates the drm_gem_object_funcs struct initialization in the DRM
> > > GEM module to use pin_init::zeroed() instead of explicitly assigning None to
> > > unused callbacks. This fixes a build failure caused by a newly added callback
> > > field in the C structure.
> > > 
> > > Closes: https://lore.kernel.org/all/aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info
> > > 
> > > > diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> > > > index e1ebad77ebe2a..c63b0fe5a15e1 100644
> > > > --- a/rust/kernel/drm/gem/mod.rs
> > > > +++ b/rust/kernel/drm/gem/mod.rs
> > > > @@ -266,18 +266,8 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
> > > >          free: Some(Self::free_callback),
> > > >          open: Some(open_callback::<T>),
> > > >          close: Some(close_callback::<T>),
> > > > -        print_info: None,
> > > > -        export: None,
> > > > -        pin: None,
> > > > -        unpin: None,
> > > > -        get_sg_table: None,
> > > > -        vmap: None,
> > > > -        vunmap: None,
> > > > -        mmap: None,
> > > > -        status: None,
> > > >          vm_ops: core::ptr::null_mut(),
> > > > -        evict: None,
> > > > -        rss: None,
> > > > +        ..pin_init::zeroed()
> > > >      };
> > > 
> > > [Severity: Medium]-
> > > Does this commit miss a similar update in rust/kernel/drm/gem/shmem.rs?
> > > 
> > > The VTABLE initialization in shmem.rs explicitly lists fields without
> > > using pin_init::zeroed(), similar to what was fixed here. When compiling
> > > with CONFIG_RUST_DRM_GEM_SHMEM_HELPER=y, won't this cause a missing
> > > field error for the newly added handle_free callback?
> > 
> > Sure, but it should probably be a different patch in that case. The
> > current patch fixes an issue to a currently existing build failure,
> > while the issue mentioned here has not manifested yet.
> 
> On second thought, this is seems to be using the same binding so this
> might be accurate.

Confirmed, on an arm64 build with the Tyr driver enabled:

 error[E0063]: missing field `handle_free` in initializer of `drm_gem_object_funcs`
    --> /home/klara/git/linux/trees/next-local/rust/kernel/drm/gem/shmem.rs:130:52
     |
 130 |     const VTABLE: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
     |                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ missing `handle_free`
 
 error: aborting due to 1 previous error
 
 For more information about this error, try `rustc --explain E0063`.

I'll wait a while for other thoughts and otherwise respin with this
included.

> 
> > 
> > Regards,
> > Klara Modin
> > 
> > > 
> > > rust/kernel/drm/gem/shmem.rs:
> > >     const VTABLE: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
> > >         free: Some(Self::free_callback),
> > >         open: Some(super::open_callback::<T>),
> > >         close: Some(super::close_callback::<T>),
> > >         print_info: Some(bindings::drm_gem_shmem_object_print_info),
> > >         export: None,
> > >         pin: Some(bindings::drm_gem_shmem_object_pin),
> > >         unpin: Some(bindings::drm_gem_shmem_object_unpin),
> > >         get_sg_table: Some(bindings::drm_gem_shmem_object_get_sg_table),
> > >         vmap: Some(bindings::drm_gem_shmem_object_vmap),
> > >         vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
> > >         mmap: Some(bindings::drm_gem_shmem_object_mmap),
> > >         status: None,
> > >         rss: None,
> > >         #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")]
> > >         // SAFETY: drm_gem_shmem_vm_ops is a valid, static const on the C side.
> > >         vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
> > >         evict: None,
> > >     };
> > > 
> > > -- 
> > > Sashiko AI review · https://sashiko.dev/#/patchset/20260908175427.47207-1-klarasmodin@gmail.com?part=1
