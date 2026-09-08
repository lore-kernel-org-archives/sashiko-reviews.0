Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280D755D876
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 19:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788894585; cv=none; b=qA/ar793iQtJgSwcFx3osYRpPHsQjnbsAGitYdUj31dCnBbADu6f7wdbbNk72KAiV0zYuTUqbsyUB+A5oIlY8xeX6thTf0rp5xblGZ2Lu/oJ99kE0H3JeLZE3aTSbn9USZPHS36c6qEqrj1pzs9nbs7YsFIBV087PsQWYBJVRQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788894585; c=relaxed/simple;
	bh=IcAawRnObFPysnJmjNwytmKHCHwqA3DD3ILgLIKfS0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8Rm4lVTk2zIHq/3uoOqze+KRTreuturdBjYZ2Wh/2QpK9fefrn+VjdVh4QFRi0FTvc4qvPdRbkooWrLdTdhXdwcmPNo5467Op1C3xU+6V+ziRIqxUhNZMx2Se/R7WJaUnEhgKJKQ8SlqohZ4RrWE6GpgCckIhEyHnt3OY3+8rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZA1TCpHL; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZA1TCpHL"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a472ff39d4so24474081fa.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 12:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788894582; x=1789499382; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JzCxaqYiEeBDnH0h79ydYlAnHFlqut2ERcxebrbyVOA=;
        b=ZA1TCpHLLZovQej5739ooc5DT9UQB576AJKREpVx7wpyXNfXxSUmxDPCoghXYSH/vh
         RMQ/B5rhL3iNiFUlehXM2xF7w2KG6y6sq+RAlqpNSmocuhZ1MP6Gld4xghwmLLiM0xxR
         +ZRClH2ARi3yEVXhNDaFoem2oYNIIG5qCiwUtg5day7a+JSH13OIyKaUBhEvmW+6SKZF
         U+Yi0jTf0c2k5Rh4ybdd338joFkDljD1jZBHGXxvkyfDzer21YNYXAb7cYzmCzB+ElS8
         aVtksdn3BlxK+zH73eg40eRyThDyQpuLNhtDebRL+YpfP4XakVO/NJVQB9G2g75KwOJY
         ebUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788894582; x=1789499382;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JzCxaqYiEeBDnH0h79ydYlAnHFlqut2ERcxebrbyVOA=;
        b=b7p+V8AebZTKB3HWE8gZIzXcmA/XbIgQta6GgcdBwPubXXGNzUqZZiFPWFAx6V3N0c
         1iwvToAEkw7gp4AYtUN5N1xTN4APv53kmj9SBEak9/Tt4Gdb5I9HvwTbpvLIxZCYrmJT
         hXQqh7Q74svVIBFSv4JlyQey/XGwZTpf9UcwZsNfK1cIW4o/ZrqJ+2vz7J/tl/JnAGKT
         YmnudpqLd3o2iixZb26wo/1iZP4Eb/bNOe4nxUbwffZ6XXu4MGlHekCbpVWVUB2xjlZV
         34pEXsMlTKn8yuE2nqO06cielZWtHAjkSJ+typHjKUp8p/INfAhINvIjlFSAtsopjBXh
         slKA==
X-Gm-Message-State: AFuF++lRrPnluNP9qI4aFeH03Os8Zk7mQeBaqJXa7AwwpBiEdNkPm8yC
	Z1pdNTFdlmXKOM4lHgZ2x+hIhRaiOsFUMCFcRc8OUxlHE0JNESlhTZBSGUWn4ZBB
X-Gm-Gg: AYBFou3Z2Tp5czUbm34Ykorp1Ja7VnQQZyt6Z/QdgVSGyNul1pAHJg4wHM6L+tDAqpA
	+1C+Gur6ZE9ZQKU9CCmTXfWcjYVEDy28gDTOozQ0W5MJZrgJHG4DD+miTB2OqY7hWsrL7d3X1Pf
	kPD03yk23aHGIzuaaTu3kBrJbrhVNXU/Ewr9Z3cyC3woxd/S6aDyVJLM6nYs3XEzDJLkKPGNqS/
	kVwksediZA9m2FLgzFD+ue3x2xy/Fo8YYgSgNKsQgAxZxOILcf7pOL7TGDAZZQNjDB7qFqZpqFV
	0rAhxBsgPnnKq9ipJYC+Hv+xPx5UKIHhfQrA0Wx4JHZjM6uuvrjIhMK04LM8twgjXKlc3gKB36B
	Zea2EnV0G/qmr9FBWCIKH73RW68BJsMmfSDVSfW+Kgf0j1BXzJit7CQvLdhFkbaXA8I9LVt0psc
	wmeq8a8SA6IOK/h7l+mof7iAUgHAECfEXZXYZFOllEknvfUaVURSc+RpAuraNOwzs+nINkON92l
	Dmo
X-Received: by 2002:a05:6512:15a1:b0:5b5:e3b9:2236 with SMTP id 2adb3069b0e04-5b616edef30mr4548116e87.1.1788894581868;
        Tue, 08 Sep 2026 12:09:41 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166ed4dcsm3212290e87.20.2026.09.08.12.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:09:41 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:09:40 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust/drm/gem: initialize callbacks with
 ..pin_init::zeroed()
Message-ID: <aqBdJY43QlnN5wnx@soda.int.kasm.eu>
References: <20260908175427.47207-1-klarasmodin@gmail.com>
 <20260908180555.0830E1F00A3A@smtp.kernel.org>
 <aqBX1siwtKuBTXBE@soda.int.kasm.eu>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqBX1siwtKuBTXBE@soda.int.kasm.eu>

On 2026-09-08 20:57:05 +0200, Klara Modin wrote:
> On 2026-09-08 18:05:54 +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Incomplete fix: missing `handle_free` field in conditionally compiled `shmem.rs`.
> > --
> > 
> > commit b5b83bb373847c99ca6d286c268d2e0ffab299f0
> > Author: Klara Modin <klarasmodin@gmail.com>
> > 
> > rust/drm/gem: initialize callbacks with ..pin_init::zeroed()
> > 
> > This commit updates the drm_gem_object_funcs struct initialization in the DRM
> > GEM module to use pin_init::zeroed() instead of explicitly assigning None to
> > unused callbacks. This fixes a build failure caused by a newly added callback
> > field in the C structure.
> > 
> > Closes: https://lore.kernel.org/all/aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info
> > 
> > > diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> > > index e1ebad77ebe2a..c63b0fe5a15e1 100644
> > > --- a/rust/kernel/drm/gem/mod.rs
> > > +++ b/rust/kernel/drm/gem/mod.rs
> > > @@ -266,18 +266,8 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
> > >          free: Some(Self::free_callback),
> > >          open: Some(open_callback::<T>),
> > >          close: Some(close_callback::<T>),
> > > -        print_info: None,
> > > -        export: None,
> > > -        pin: None,
> > > -        unpin: None,
> > > -        get_sg_table: None,
> > > -        vmap: None,
> > > -        vunmap: None,
> > > -        mmap: None,
> > > -        status: None,
> > >          vm_ops: core::ptr::null_mut(),
> > > -        evict: None,
> > > -        rss: None,
> > > +        ..pin_init::zeroed()
> > >      };
> > 
> > [Severity: Medium]-
> > Does this commit miss a similar update in rust/kernel/drm/gem/shmem.rs?
> > 
> > The VTABLE initialization in shmem.rs explicitly lists fields without
> > using pin_init::zeroed(), similar to what was fixed here. When compiling
> > with CONFIG_RUST_DRM_GEM_SHMEM_HELPER=y, won't this cause a missing
> > field error for the newly added handle_free callback?
> 
> Sure, but it should probably be a different patch in that case. The
> current patch fixes an issue to a currently existing build failure,
> while the issue mentioned here has not manifested yet.

On second thought, this is seems to be using the same binding so this
might be accurate.

> 
> Regards,
> Klara Modin
> 
> > 
> > rust/kernel/drm/gem/shmem.rs:
> >     const VTABLE: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
> >         free: Some(Self::free_callback),
> >         open: Some(super::open_callback::<T>),
> >         close: Some(super::close_callback::<T>),
> >         print_info: Some(bindings::drm_gem_shmem_object_print_info),
> >         export: None,
> >         pin: Some(bindings::drm_gem_shmem_object_pin),
> >         unpin: Some(bindings::drm_gem_shmem_object_unpin),
> >         get_sg_table: Some(bindings::drm_gem_shmem_object_get_sg_table),
> >         vmap: Some(bindings::drm_gem_shmem_object_vmap),
> >         vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
> >         mmap: Some(bindings::drm_gem_shmem_object_mmap),
> >         status: None,
> >         rss: None,
> >         #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")]
> >         // SAFETY: drm_gem_shmem_vm_ops is a valid, static const on the C side.
> >         vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
> >         evict: None,
> >     };
> > 
> > -- 
> > Sashiko AI review · https://sashiko.dev/#/patchset/20260908175427.47207-1-klarasmodin@gmail.com?part=1
