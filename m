Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150B621D3F5
	for <sashiko-reviews@lists.linux.dev>; Mon, 15 Jun 2026 02:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781488831; cv=pass; b=KiFk11ChctZBcd8Wfa0mpuAmT2Q/B8bAuHR+ZPQ/tNTol8Dkk0G4Men98hJzkZlwrCd/nacOjerUGqdsrei4r6K4OELFnGpnI/vLJqdaenxH+QwngHuvC/WC1gpH+mgs1Szlaq6C7LCoPqjJ0LM58ECkGiojXAXVr2mmSDFkev0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781488831; c=relaxed/simple;
	bh=KgjjAM/+u+dPbDFVxObvOG3fcUzOv7CPnrkLCUHTgIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJy88pLSLZmsw5Qdh7T3SkfGzviO/J1wE+f3XnRvC8ZIaT0YS+KwYoFqNsQq/p7qvzKClD8GZoH2eF0jdOsYoeLBVGCtVNduXEwulEOHhEQMRnj2JbEqqsH9riZBhg3ens7821v9Gsze6aOYgZ/foo/Jg5Y/mFmZ2oKuYSbs/dA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFLhT+0J; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFLhT+0J"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4905529b933so28226525e9.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 14 Jun 2026 19:00:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781488824; cv=none;
        d=google.com; s=arc-20240605;
        b=RShF0skFn0iaOe1jWnx8jw7NGRr3DOpjKPMwL7W89lp7xUgutqt41cwSZVqxSLUAd3
         g2mJDnoto7tTv15J9ZbcpXIH44yywaP8s+at8CoWpTqXKQz0SK48JXkPKUJcnXeEn+Pz
         Va1m4lOYJrhq9XMgNal/EWBSFwbw9Sn80cSRrKZSFhFFkFzOmS+XiYabBbMv5d8ahmxE
         aWdMUsJzxYlsHzRRRcV52WLfdI/oLmDfcUHL9Z8I8VUreZz+tk5K66eWu9Cv5IK4Mk83
         WLGQxtJQZqneMKW1+0AO7WX/c54IV008ob2ZMZlthiUue5iNBV0Iu/Bds4gSwRUm0HF5
         0w5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qeIjIUBlbxcxSnWc6641z5CvcWAgKc4zbS4bMQ46+jE=;
        fh=gj73vF7gfHpskuYo4ZPaNGDMo9r8lFxbvv5q5QAWYg8=;
        b=OBhyKCEK5HOIQRccu+GRbPZY3h7P0LZQB4U3YfKjnpftPDBWxHyQ9gX313uB3VCo+X
         T1axcx664xG9XvMbsPjrKdqPC+kDPlDydhRc9cpOFXJ60VvwFl+V9J0zYb0lOmEW452o
         5w8oaflOc8ZAUvRvOpxfXwRZmz9E2f9HSZyloL7jnjfkIm58iAiNQPJAk5k0BwFpak9y
         /8VQxY8qAWbFvsZh0SCt1KNKkm26f8uSaAxybmKqjR2t+tYEGaOHgW0M1Xe6gyJuO50A
         ZmJ2QIQQIocpT1EbOK4tqin3tqDS+fKefoVNeSL5Ix78Kpc55toSyBwo0jl6nbgsfNri
         Oa/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781488824; x=1782093624; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qeIjIUBlbxcxSnWc6641z5CvcWAgKc4zbS4bMQ46+jE=;
        b=VFLhT+0J8egnzoO5jbcy/RxD6Z7adsV5gfXA4pefyJopL6mPKZ/yghnVOdYJckeWoo
         pHZ0bpqFB8JHG0Fhw5biNeodwQa7tnaZCQUY/et0h+2dobGqGs5j1k6IAoeNVuN1IBA3
         CVokC3R0pY12Vi3/3l2E5diNm+Ia5czJNWja4i6q72q8oHoDH2sKRecWku2z5km24QOg
         1SJoXp/71Gz7KSYClG+ma3Lne4j3ci/h8pwdLh64ikW9runWMGQ6+Rv8X4icYLRrfn+i
         5fga0L4BOiraSHPcAOOavA3c+lTfTEgBC02EwiIqfQHc4q/E09DCRc5CjVXbNNudTSdh
         MOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781488824; x=1782093624;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qeIjIUBlbxcxSnWc6641z5CvcWAgKc4zbS4bMQ46+jE=;
        b=ea8kSohJgt1btQzCv4M6Sw+VkilkDZAD11Y1B4MdKxwU0az2R/WoCEuu+RgPHE2mbx
         +0uuW5J0BbhebydGGW1kVMjNt1cq+S2kfHIGTyx7tXJStkFSPs5VHDeJWa9YLFg4LXdF
         jyIRcd4bAE9C0sf1P0bZUs6B1j3QTfukTtdDmSH/xuFtVcOEJE3peqMSeLmPor3hIXZV
         7ywFmvYQMxNQCLViAkk4x0trSV9fT4esKRTpmB3ZikrSafgesVa9pHMf9XsP8QEreQ1B
         TRn9EBAuEj28dhdLcGpYtGuksMxfxbGT6s5FB45z3SfVyXl3sbXyFxp/kF2e3arta7D8
         SqBA==
X-Gm-Message-State: AOJu0YyDHF7fC7arsh3couc0ErRnRt2jkVELNmLi6slQzLXjcGNnRgsk
	f6Wshwk/OEowKPMxuWfKMRNHrnl8susrz88dSXj3KQB7ctIdMsgQGZjXCNBq35WUNVmnmN4BXbK
	pLC57huwjDsvj5vcRbMDOMKFoUTD1DCpN60C5
X-Gm-Gg: Acq92OFRluD/M2wuHgsv7dEklIBh97iAixljKVdFJ89XveIpyVZ9UOc6q99eSxj38A+
	FHJ9AmlIiR1GItiT6WbobM0HHar81gGLN2iQsZdw6OVt2YfwtjV5+YKH5+MnauC+wVVt+dj5s1s
	jAvy52DRvUwfC7vLZOvDqZB43NBNdYI2R6wD6bpvne6oY0f2Zpof0RyUSPh+WLj4ArSlHn1T3Ov
	LW6hYjcUlfmG16v3SNk1wEaGlQhgOe4O8UuKSyrfuIPaH/+e0r+Q0nyHbGgSFXVEwnbTtE6Fz33
	kBQGVxPEQqgRXl+DAmWl9YWotS5D9jPSqFMvhw==
X-Received: by 2002:a05:6000:25f7:b0:43d:7868:21f0 with SMTP id
 ffacd0b85a97d-4606da57dd1mr16019997f8f.9.1781488824357; Sun, 14 Jun 2026
 19:00:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260612193738.2183968-2-nphamcs@gmail.com> <20260612200234.93CAA1F000E9@smtp.kernel.org>
In-Reply-To: <20260612200234.93CAA1F000E9@smtp.kernel.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Sun, 14 Jun 2026 22:00:12 -0400
X-Gm-Features: AVVi8CeBboNpYssU25ojNOxnTY94QiMaMqzA1T6X7OZsH2_len7MxYqDu_iYH-I
Message-ID: <CAKEwX=M1OE5Rjcs15ZJUJe7ymiQ4VbCfwtkRPu1+8PcKA_wCyA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/7] mm, swap: add virtual swap device infrastructure
To: sashiko-reviews@lists.linux.dev
Cc: hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 4:02=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] Dead code in `swap_type_str`: VSWAP devices are never displayed i=
n `/proc/swaps`.
> >
> > +static const char *swap_type_str(struct swap_info_struct *si)
> > +{
> > +     struct file *file =3D si->swap_file;
> > +
> > +     if (si->flags & SWP_VSWAP)
> > +             return "vswap\t";
>
> [Severity: Low]
> Is this branch actually reachable?
>
> Looking at swap_start() and swap_next() in mm/swapfile.c, the seq_file
> iterator skips any swap device where si->swap_file is NULL. Since the
> vswap_si created at boot has no backing file, it seems the vswap device
> will never be yielded to swap_show(), making this dead code.
>
> Additionally, if the device were somehow yielded to swap_show() without
> addressing the file check, would seq_file_path(swap, file, ...) crash
> by dereferencing the NULL file pointer?

Looks correct yeah. I think this was a hold-over from older version of this=
.

I'll fix this.
