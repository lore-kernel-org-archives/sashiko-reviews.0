Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3E344237D
	for <sashiko-reviews@lists.linux.dev>; Wed, 23 Sep 2026 06:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146613; cv=pass; b=fh5wkT1IQklJdfrXMbQfYpa5A06vAjRzUZjKfZNwa0sLrpP8iSvCfuRHzdeqYgwm7jcs5qBUzN9JPcxULjgt7pVgPyY30tYOnnyCARL26BCj/UU6YhyrZ/BcErxvinotTtWhwF8/Qgp3kw1MVe7bzS+yHvzoF+M8RN6b7ewNUl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146613; c=relaxed/simple;
	bh=9xHQ3WPoBRJA6pLffeOMmxeaFKJ9Fi/A5A4l8P9y8gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aV3iPfmBtxqxjRkO3jhjWW+ryXHy2FeLEvAJwgHXSfk6MtOqq43ggkz6vPNKKjKxdZ2ayNcVGsw1OT5ms/cJhqJVXzXMhb7egiLIVYY0VVMx1rGhAXFzBf8baPjzeDxXic/nCJKJNxbYjmW/xlB/opaeYauPy6bE2xNYk7QN2SU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UQ8r29Pz; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UQ8r29Pz"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-98296941f99so321535241.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 23:56:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790146609; cv=none;
        d=google.com; s=arc-20260327;
        b=mjj0Pac1znfj8r94kt28fxqHSa6wWf7iTAFvANp2NpTjlFQRftKeUvsRE2DncYwzFg
         /DAjJcnGS9bbFSAWoad+5zx4BH0to++egJRgLWoNfFHCEceHRbyGWkpLBNnCpjR0gvVp
         8YNSJNpSVf0vnGoryoFYbAbq0MVby8hIf5lGLvIQO2T/c8Xos+2GY1S+3ilTfBSYtbgU
         Cj74PCiF8tl7eimcAWjo2u0IG10Q4/wxdgdelWTECpyB4lATz5yyUbz8jZaFF7b8umZl
         fqwziuiJy4YE60HX3KBdLfhfqYjv8dm30BiG1h6VEw0rPrmirf9BmxjrE9rLbLSe09kd
         q3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sAxPiacOiPR9kbZrzNk61u7R2KSBWQzo+Rt1br4Efz8=;
        fh=sKsw14osZHHM4TYGm5zkUeVpQ1yZ+BdVJTrDBr186F8=;
        b=sIbLnLxoAOw2cGtcXrvTmX9K5d3RpkBpjvmbGOHkdT9jXVYe8HJNKiHCqonEFhIm0q
         /Uv8g8z42ue7gFCrJNIDFTbbY0PA88F4ERWIYiOqtTak+w7xLokbAfJo78FMXpN9qwl8
         w/58/WgR6Eym5UXA+5d6INZdgXb1cBi/4J9iJL1XqkF6WBqRjtdzGl8L3EXarsMaGt0f
         NKpI0Vw6UKfwodE0CICnFDMIPiOIKm3ytBR95pbZ4GKESByc1kVuuOyZeloRm87d6PXd
         clMqHw9gB4tb7Ffs0gVMDeeRXtNio4qeV7VFOw5UX9uSJ7V6l2eIauMoaDFBJRVQizmM
         0HVw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790146609; x=1790751409; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sAxPiacOiPR9kbZrzNk61u7R2KSBWQzo+Rt1br4Efz8=;
        b=UQ8r29PzITyNjaDMduPEV6oh/ea2/14ge0CCtQJOGSxu/ks5xupRPIN0rAO5dtJoZ0
         uCcTLxbBeyFE369z+5lgbvcFFVevuo7Un9xTwtSD8VCsccddEK/HFvu04wQ7JhUwTk5n
         aHnyOJmwDIHEUaeYPsNsm89CRsOlbx6foLLZlzr/WbKTDG6D529h11KMolSmSjidvYkR
         g/S9sctDh8P311nKZankh/2EqKF48AFANGvOO7cMjbG4XYTvunFYGfqAGhnnKDbzrBEs
         DNbtOjC/ppjpeaX/AtVZ8V8wJV2bc/pnRZmxUT0Jfu36MvvKOw8Jr6tZYJDKSmSJOg3A
         YxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790146609; x=1790751409;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAxPiacOiPR9kbZrzNk61u7R2KSBWQzo+Rt1br4Efz8=;
        b=aI/QN1k9mD3tY/5PLXCQX7fq4m62sETbnJkRSVet7ds7hhgbiV07thGLYBU7Z1HtJc
         jsNXjA4Bv5udk5THjigq30IzIs40noIWb60KVB3G/4qFG8gUOpQrNjEQl5BCi1s93RY/
         53uJ5omBw0TxleYRZDrZGT67+BIE6V+DTR9UP4aZf1pc7Wd4eOVCTmyDP1ZBs9M+1cko
         kenYDg8vfREfE52BtNPTckiRl55c9HivQ68v/O1gb75ukTPlJIN/No4wtRfEQ+No0kfi
         efYoUknO4LeuKFdE2+TXhKcJMi7wsR8nKlGpUT8Rb34VXnxOsuR6VtkAiTpeKE653x7B
         yzDA==
X-Gm-Message-State: AFuF++mzMDN/ReXx9afHMY01pMUh7Qfp2T72BdYXhlcIBi2gzfNvu26A
	YU71wjujx4yr7o5S6L7LAm4LIe5N69eeTvWVEYvcxW/Yd/WD2ZHuhth4MbbRcJZ3oiq8S1xMCyV
	YLjsqbXB35ExAJkEEW0j/KYD/Ez5zIypfpiU34GP02MOa+eXJ5BC6dOE=
X-Gm-Gg: AYBFou1Lv0la1uKSv11tfLGR5tYASUMZgEmNb++Ufl+6ayQSNgyse4JKHSfKxwWdNHE
	TA++TUM2c/u+iXckn7iz/4LJLSRbJEUNw5NnYv+i47c54FZNegxJCnU5qsJ+qparY8Rgy29QIEl
	yk7S/FVCrMZgfH3HYPDfYsrOcAQ0lG7irURko/+JOaL58/h1J3zmKI32rcmz21J62lyFCVSYo/G
	ltzh7UBcW+Pq76TBsh0IaT90Znes9Y4NiQo+OEFZoXx/8sXTwtWzn1XyBp4ihuvsbPe4ymFkHSH
	fb1P7eXwUoS+R+75OcSbn1ycfokjLKL85hUtOOE8FW07hJs85SYbWJYESipNq549YKi1e39Zkqn
	WVWO0+p42+ErNiswjWAho
X-Received: by 2002:a05:6102:c94:b0:7a7:19aa:8a81 with SMTP id
 ada2fe7eead31-7ac1ceab000mr1709991137.28.1790146608109; Tue, 22 Sep 2026
 23:56:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923063114.2683575-1-morbo@google.com> <20260923064622.90D881F000FF@smtp.kernel.org>
In-Reply-To: <20260923064622.90D881F000FF@smtp.kernel.org>
From: Bill Wendling <morbo@google.com>
Date: Tue, 22 Sep 2026 23:56:30 -0700
X-Gm-Features: AclHuK8okRDYHTzt7mr8q9IW4N8bIkemMSEoI0A8lraA56wTX6JOq4NKSUi0ez8
Message-ID: <CAGG=3QUPSZeAPQg=MmxXqqvr3xM3PwV84HVGKryhmk8qJZoTkA@mail.gmail.com>
Subject: Re: [PATCH] HID: bpf: add __counted_by_ptr attribute to device_data
To: sashiko-reviews@lists.linux.dev
Cc: dmitry.torokhov@gmail.com, linux-input@vger.kernel.org, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 11:46=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] hid-bpf: false-positive bounds check panic via data race in __hi=
d_bpf_allocate_data()
> --
>
> commit 4a962db9c72042e7d956ca752f9439fb64fe5e37
> Author: Bill Wendling <morbo@google.com>
>
> HID: bpf: add __counted_by_ptr attribute to device_data
>
> The 'struct hid_bpf' contains a 'device_data' pointer field and an
> 'allocated_data' field that specifies the size in bytes. This commit
> adds the '__counted_by_ptr' attribute to 'device_data' to enable bounds
> checking sanitizers.
>
> > diff --git a/include/linux/hid_bpf.h b/include/linux/hid_bpf.h
> > index 19fffa4574a47..f45fb9cccece8 100644
> > --- a/include/linux/hid_bpf.h
> > +++ b/include/linux/hid_bpf.h
> > @@ -185,10 +185,12 @@ struct hid_bpf_ops {
> >
> >  /* stored in each device */
> >  struct hid_bpf {
> > -     u8 *device_data;                /* allocated when a bpf program o=
f type
> > -                                      * SEC(f.../hid_bpf_device_event)=
 has been attached
> > -                                      * to this HID device
> > -                                      */
> > +     /*
> > +      * allocated when a bpf program of type
> > +      * SEC(f.../hid_bpf_device_event) has been attached
> > +      * to this HID device
> > +      */
> > +     u8 *device_data __counted_by_ptr(allocated_data);
>
> [Severity: High]
> Does this newly added attribute introduce a false-positive bounds check p=
anic?
>
> The commit message mentions that allocated_data is always set before any
> access, but looking at __hid_bpf_allocate_data() in
> drivers/hid/bpf/hid_bpf_dispatch.c, it appears the pointer is assigned be=
fore
> the count without memory barriers:
>
>         *data =3D alloc_data;
>         *size =3D alloc_size;
>
> Concurrently, if an incoming HID report triggers
> dispatch_hid_bpf_device_event() (which holds driver_input_lock but not
> prog_list_lock), could it observe a non-NULL device_data pointer while th=
e
> allocated_data count still evaluates to 0?
>
> If so, would the new __counted_by_ptr() attribute cause sanitizers to eva=
luate
> the buffer size as 0 while device_data is active, triggering a false-posi=
tive
> kernel panic when memcpy(ctx_kern.data, data, *size) is called?
>
This is a false-positive, though arguably correct way to look at how
initializations of a counted buffer with its count field should be
ordered. It's a false-positive, because assigning the buffer isn't an
access. I'll send a v2.

-bw

> >       u32 allocated_data;
> >       bool destroyed;                 /* prevents the assignment of any=
 progs */
> >
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923063114.26=
83575-1-morbo@google.com?part=3D1
