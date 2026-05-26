Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95C63B635B
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779812862; cv=none; b=c6AUrQhh0WC9moH1bVwOJaIvJqDcA2bTKvE8L5WNg70a2Pc7/oibgO8mEQAEcp3Eny3gq/G7OWbqyNRqejcMZaz/eNTZ5zHh8nDZdwkqGmZAfO23q00qMFaDubHWjcuxVSusTRf+1zYOKxj9LATucZ8aDMjZEeaN5RTXRR9lFS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779812862; c=relaxed/simple;
	bh=HUZBxuO6Rdu4JZ2TTrCaaAQlkSdZmVn8zxUJ032xP18=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ttlO2nm9rRipqWUCWY8X8/SlEZMO65Hnd0Uf+SAnHHrLRafCEQzENZVbYHhzsoieUmYEiMROeAfVgFnNNSMFXhrjAwJA2M5KpeNMraZHoIxWiJd0PHAMVL6y+8MhVrqumAVspHAAJSFMGH9PEXt1MgXzyF7TOv02x9SicKdW5Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WTH2ckys; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WTH2ckys"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D85C1F000E9
	for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 16:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779812857;
	bh=7/JsACEnR5bwkmP2QsNzdqjOcAvyZj+hedPj+f1rhXI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WTH2ckysHg/G0MEhAzJuHQ+z6+/1lhGOlhWXa0BO0Ijce4p2K5QcznmUMLpPyasTr
	 DMUyaIZJKvYwLJv5vwEbJkDGwosCNJC7y+Qpo9tVnpVLFdKaKfY0gLjylh0XNfZLUe
	 8x50idXm1n2UPocAqXQyl3BqtJZaJp22QP6XWnY4jyUTjOEgQFmwei886nk017uTXC
	 LrgiJUnkaqzkMnZQM9bNa4rQHuuRM5pIM+17M1hFvdZUnxIY5dx32L/1GlKuBkTEBG
	 tFFwqpAAgXjXIV+5BhSjhvhcOSsrEyPnKjcWPge3jKYc67XI/h7KA9I6Wr5rkL1tc6
	 CuL46j7KIo2GQ==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a87782588cso4181003e87.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 26 May 2026 09:27:37 -0700 (PDT)
X-Gm-Message-State: AOJu0YwoGRok5exe1E7eQDxEW0TkN2GQIsny+ZwOOwOnVNlCcuMncTaY
	LvLnNUnb9c9cun0BUrkX+hlTnI+zzu13OqO5yZt146rEZ8agAWDJsQ6Qrpdb79Z/8eewrh8I3Kh
	Kgky9tA/7BIfKllF2V3gzaoiD46dPDv8=
X-Received: by 2002:a05:6512:3ca7:b0:5a8:9909:50b1 with SMTP id
 2adb3069b0e04-5aa3233bd67mr6050601e87.10.1779812856036; Tue, 26 May 2026
 09:27:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-trasnmute_ptr_to_ptr-v1-2-d89bc1dda3b5@kernel.org> <20260526153411.EB3731F000E9@smtp.kernel.org>
In-Reply-To: <20260526153411.EB3731F000E9@smtp.kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 18:26:59 +0200
X-Gmail-Original-Message-ID: <CAJ-ks9m2zgoSYBhwQMoaspHx24KsKpg5Kye=QuhZMsUEeAsWMw@mail.gmail.com>
X-Gm-Features: AVHnY4LGWBEY6iuWXB33HYkDVKLJWjGKmvZbkHkhunNwTOOMZgBSxapL6dSSy7E
Message-ID: <CAJ-ks9m2zgoSYBhwQMoaspHx24KsKpg5Kye=QuhZMsUEeAsWMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: device: remove array copy
To: sashiko-reviews@lists.linux.dev
Cc: ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 11:34=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The patch introduces build failures due to an unresolved import a=
nd an invalid use of `mem::transmute` with dependently-sized types.
> --
>
> commit 26f48b363794b9236d6891ec163d637031d529d5
> Author: Tamir Duberstein <tamird@kernel.org>
>
> rust: device: remove array copy
>
> This commit attempts to remove an array copy when initializing a property
> array by replacing [T; N]::map with a transmute from [MaybeUninit<T>; N]
> to [T; N].
>
> > diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/proper=
ty.rs
> > index 87be2784f7a7b..a85467c996369 100644
> > --- a/rust/kernel/device/property.rs
> > +++ b/rust/kernel/device/property.rs
> [ ... ]
> >                  // SAFETY: `val` is always initialized when
> >                  // `fwnode_property_read_*_array` is successful.
> > -                Ok(val.map(|v| unsafe { v.assume_init() }))
> > +                //
> > +                // See https://doc.rust-lang.org/stable/core/mem/union=
.MaybeUninit.html#initializing-an-array-element-by-element.
> > +                Ok(unsafe { mem::transmute::<_, [$int; N]>(val) })
>
> [Severity: Low]
> Does this code cause build failures? It seems the mem module might not be
> in scope here, requiring core::mem::transmute instead.
>
> Additionally, will the compiler reject transmuting between types involvin=
g
> the const generic N before monomorphization? The Rust compiler generally
> rejects mem::transmute with dependently-sized types (error[E0512]).
>
> Would it be better to bypass this limitation using a pointer cast and rea=
d
> instead, like core::ptr::read(val.as_ptr().cast::<[$int; N]>())?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526-trasnmut=
e_ptr_to_ptr-v1-0-d89bc1dda3b5@kernel.org?part=3D2

Sashiko is right. I think it's best to just discard this patch since
avoiding the copy isn't possible until Rust 1.95.0.
