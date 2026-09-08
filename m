Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF5D59C970
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 18:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788893830; cv=none; b=nO2cAQmMl6WhZeLoZPGLlovw0gxq4WvsHRr5OI7P/J8ez88FBTPmMpPoFCvfqcJFueEvHqGaPoDATv3V2axf/DzRlUidRTpTJmLYnYgzpClT/qQHCLy8Qajx43ysHBvlHC7A6dcjAnW+rE+P6XwRvpKWzJDpeJQKpdNd/T8QyYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788893830; c=relaxed/simple;
	bh=soEfeC9qUxvkfN6UEt9aQdcQ/wR4lPrN68Y2ziKQ2M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btC7SPFNXb96zoKlyx8HWAfUhUIjOU9FL8KLLW+keduV1P6jl9nU3ymPon6R8GPVaaG79OFEl1qqU9isbebkkrJnMXNEYbvVf2ug2XYapARySDVPBqWq4NgKc6H8Xfx6ljHxckauIUTn052YXGZCF5AtlLHCX9Zow/B6aQ5sUgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiJI5I7P; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiJI5I7P"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3a472ff39d4so24331281fa.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 08 Sep 2026 11:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788893827; x=1789498627; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dPAv9/DNHgYvkBswgfcYE+/SWcKiJRn1AWqpJM/JUGk=;
        b=SiJI5I7PX9bRtVr6hR7NUifRKo/lHeRcGeRBuNN704UMH5scce+WmyJca/KAjNdBWv
         knGJx/HfLF3jJ13QC8Eye6r9XL0HUDSE5hFg8OGdcDGLZIq8TaTpDHtR6SqnYkGkcrnE
         pg4W0c1dQduX4pyO3fQWYhtvEIhCdytUXpo+FZAQ9ImgM9BybuNlltSqLGQHvuZrZgJc
         bX9AvFyCyJXSmfWHn6PfRaF6Tc41td9owZk5HWCbo7fH9+sXe5Qn9diHW3JuEK8EX9Cr
         XYE69YTbwL77gBgeFZ6dynkk7E5H/vAEY/1B/0ZL+rIbr8N4trHQ3i+YCdisjJWBj1gA
         v03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788893827; x=1789498627;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dPAv9/DNHgYvkBswgfcYE+/SWcKiJRn1AWqpJM/JUGk=;
        b=d/cuRXPy7Bqeu/Ba8KAfcgJmgyOwNASklLAL+Ypmus4KFKoJMnCSbCL2omn3iCkjXv
         QVERHMjnsAgSES5LEvv0yF8e1zSK/i9VlJgwLQJB35vzFGqEcfGNrPkREXYJTyOlmSus
         ZI6kmWH0jB9ydPevRvEvLYN/4xNGSCyFfHdxdnHp8IXCV+eX4dOXNJ7YuQmSBsE11bFT
         EaM1MJ4ST8SlVVnizCpgNnaY6J0SFl9AgsnifrE5CY0b9csxhZTZxdU+U163jylqmGjP
         k2q0gcD3yiY/x1kEv0t5NSg1Ek6MxJP2bL04TrH6q4BIT7P3zv858mEfKCvkn9pfnXm9
         Wr/g==
X-Gm-Message-State: AFuF++mhIgyHtO1cYXe0lPfER6BKMhtaSHH3/T3iaBBHhPLVvbwV5kWt
	uf46PtzRQ80pYyoNd7x4/H0saFaEmNo5fJrNZzqFFPPjChu1YrX5hE46YVmTOnHN
X-Gm-Gg: AYBFou0Ji+c31TM8Buc0PQddAOzlUaELLgOWOpLRO5xH1grSh5PxwA3sjeJcxgn1sWw
	9AIolirqWJlTDeOGp2DzJUUfF/RKj2f0Opk+SZ2jgDaGqWkYCwkyyjqwZC2rEErT+bQqX6BMUDR
	f4UzQS1aNRUJeGFO0JjJ9K+7HI06wMZH7mSi4p+k13lX2LBvY/rsG+scbCedELahAfWAVhXdBgP
	5xUtDgf9fK8sSJGVr0/8e0uJsfsciX2vxPSdpvxXljP9AeolVYKxwVt53ikQ7gc3nkBr62yxVLE
	e2Q0nHCQxqbsC/AZ4wG5XYRW/nagImVpbl1/ABcbY3BQWDknN7cCE7N/glKLIABj5EFJ1iJwqD1
	Ef2hF3zVj2O9H6ZbAVuiSX4DisxTejWI882AxBbvY/Xd4HCVTiWL6Gcng3P58yNHAUvcaNDXlz5
	tMjhJxg4KtNukEEQEmvp7o55aP10vEl8qvC2upht64E3itQWTeVD2AOLXR0KITkFLnvaWcVicNS
	8/fD9l7/Mtrqg==
X-Received: by 2002:a05:6512:ac2:b0:5b6:4b2:de82 with SMTP id 2adb3069b0e04-5b6170596d8mr4800979e87.32.1788893826465;
        Tue, 08 Sep 2026 11:57:06 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fe6d9sm3239335e87.56.2026.09.08.11.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:57:06 -0700 (PDT)
Date: Tue, 8 Sep 2026 20:57:05 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust/drm/gem: initialize callbacks with
 ..pin_init::zeroed()
Message-ID: <aqBX1siwtKuBTXBE@soda.int.kasm.eu>
References: <20260908175427.47207-1-klarasmodin@gmail.com>
 <20260908180555.0830E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260908180555.0830E1F00A3A@smtp.kernel.org>

On 2026-09-08 18:05:54 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Incomplete fix: missing `handle_free` field in conditionally compiled `shmem.rs`.
> --
> 
> commit b5b83bb373847c99ca6d286c268d2e0ffab299f0
> Author: Klara Modin <klarasmodin@gmail.com>
> 
> rust/drm/gem: initialize callbacks with ..pin_init::zeroed()
> 
> This commit updates the drm_gem_object_funcs struct initialization in the DRM
> GEM module to use pin_init::zeroed() instead of explicitly assigning None to
> unused callbacks. This fixes a build failure caused by a newly added callback
> field in the C structure.
> 
> Closes: https://lore.kernel.org/all/aaef18cd-ab55-4fb8-8563-ca3a5ea9cbc6@leemhuis.info
> 
> > diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
> > index e1ebad77ebe2a..c63b0fe5a15e1 100644
> > --- a/rust/kernel/drm/gem/mod.rs
> > +++ b/rust/kernel/drm/gem/mod.rs
> > @@ -266,18 +266,8 @@ impl<T: DriverObject, Ctx: DeviceContext> Object<T, Ctx> {
> >          free: Some(Self::free_callback),
> >          open: Some(open_callback::<T>),
> >          close: Some(close_callback::<T>),
> > -        print_info: None,
> > -        export: None,
> > -        pin: None,
> > -        unpin: None,
> > -        get_sg_table: None,
> > -        vmap: None,
> > -        vunmap: None,
> > -        mmap: None,
> > -        status: None,
> >          vm_ops: core::ptr::null_mut(),
> > -        evict: None,
> > -        rss: None,
> > +        ..pin_init::zeroed()
> >      };
> 
> [Severity: Medium]-
> Does this commit miss a similar update in rust/kernel/drm/gem/shmem.rs?
> 
> The VTABLE initialization in shmem.rs explicitly lists fields without
> using pin_init::zeroed(), similar to what was fixed here. When compiling
> with CONFIG_RUST_DRM_GEM_SHMEM_HELPER=y, won't this cause a missing
> field error for the newly added handle_free callback?

Sure, but it should probably be a different patch in that case. The
current patch fixes an issue to a currently existing build failure,
while the issue mentioned here has not manifested yet.

Regards,
Klara Modin

> 
> rust/kernel/drm/gem/shmem.rs:
>     const VTABLE: bindings::drm_gem_object_funcs = bindings::drm_gem_object_funcs {
>         free: Some(Self::free_callback),
>         open: Some(super::open_callback::<T>),
>         close: Some(super::close_callback::<T>),
>         print_info: Some(bindings::drm_gem_shmem_object_print_info),
>         export: None,
>         pin: Some(bindings::drm_gem_shmem_object_pin),
>         unpin: Some(bindings::drm_gem_shmem_object_unpin),
>         get_sg_table: Some(bindings::drm_gem_shmem_object_get_sg_table),
>         vmap: Some(bindings::drm_gem_shmem_object_vmap),
>         vunmap: Some(bindings::drm_gem_shmem_object_vunmap),
>         mmap: Some(bindings::drm_gem_shmem_object_mmap),
>         status: None,
>         rss: None,
>         #[allow(unused_unsafe, reason = "Safe since Rust 1.82.0")]
>         // SAFETY: drm_gem_shmem_vm_ops is a valid, static const on the C side.
>         vm_ops: unsafe { &raw const bindings::drm_gem_shmem_vm_ops },
>         evict: None,
>     };
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260908175427.47207-1-klarasmodin@gmail.com?part=1
