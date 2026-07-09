Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101E43C10AE
	for <sashiko-reviews@lists.linux.dev>; Thu,  9 Jul 2026 21:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633830; cv=pass; b=EweTChaEiFOj9VEJA+Ma+rjnScKAhkLeDW+z4B3u9dSGtf/0qzl1U5JpBcrRpzR/kOrBcXLWrWxBb89v78Ue+NBqnM5nMvgZeTJcwVH2e/ipBR0vC5tXkJy+WWtYJazp2Tm+T3yB/tyB8OziH3HXczbJGRO09qQAPk+rX1LMV4Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633830; c=relaxed/simple;
	bh=QZU1CA1cQeL2WvZUsAarUegvdKd7AYzS4BOYt8+niWY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FLDZ1AkSw9sh/ycRz3mTP2kL2ZmgMvcOqxGomNJlGSo+b1kv/HKc5+2Qe3AVDkOAriNaWL0cNAGdrcs5+GFB+shF5qWkpJZewKnugftYlAP869mz8m2MCKvj46y7V+tyjdvWiMe0QhT79qiHR73B4Bcn6fWjqjTQk/7KoE+XX40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqTNBruv; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqTNBruv"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-66493875766so470690d50.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 09 Jul 2026 14:50:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783633828; cv=none;
        d=google.com; s=arc-20260327;
        b=q5FJ5coZ5XJbgYWvtzh3QFINHNJ8hHDeJG3UTzXJ5gHmgyOhpakPVV45zOyOJL5uFg
         xqF+MwKB25l+HrTV+X3bz04odBXsLY4Yea4bs7WlaERZnICz+0RWfeRhQxBmEoKgZ4/u
         KfZBPkwl+Of2cD/DKhT9+7texxr55/sPnh9g6YrZIZJoGF9UWvWZWQ+bSIUSXdFwykcQ
         u0gWl1xznjWliEj9OD2PGOjQOqO+a2A3lbtkWmYL13eOfd1iNMmkU0+LR91w9f9WbuPD
         4bq1+MlUMMAidbajfiR0zIFlR88mWmXLOcHh5TnBBnzvoJ9Koz13MLLUi9KyXV9RIRBC
         Is6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QZU1CA1cQeL2WvZUsAarUegvdKd7AYzS4BOYt8+niWY=;
        fh=3KNkv6v1Gkec2EEk8oU0sEAxVjHJxM+GvNfjcKhsbcQ=;
        b=Fm983ikBsFPwspUkTbASoYIfyPtR/MzpLYq/qkfjow17I3uLQsEVvdlmcvS8ukfmqt
         bSMsGByaDPxgj6GXBDMg56AoUTbmufAsxqEv/nNsNChqZpxjzotJS/qFFg2BT3IS0yR/
         c3pzaLrpTzQq/yZ4eP2bqAl0xTVH3KG6Rm+Gdi9SglLnYIyRj59hsPKg42pzDagJKTzf
         2iMIDwh4rWgskDEyqUEBVhmX2DdZqqzxfDnvryQaLFi/ZBPYUtArCUR3tbuhFTr+E9tL
         NTjJwXXtVowLGV1HxUVj4wRiU9kIh3UAq8dm9pcX6R2/+JhQXSHcWa0liFEUdsQfd+QY
         oyCw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783633828; x=1784238628; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QZU1CA1cQeL2WvZUsAarUegvdKd7AYzS4BOYt8+niWY=;
        b=UqTNBruvYNM/WDsrnGZ7Y8FHYO3F0SptjCJxmNJfXH4OpwPbpb/K+0bx1sdi5eQFWA
         4R1Xrrk5yRTjfTH3AFXgOEIkQz5br8fVFrcEIhSNM30ANJyO3lWNQEdekfSFhd/gABAT
         91KO3hpDgoF3ElOL4e07bsiaDCxMe/Edbm+R0ecdKlT1LGn8KOZSb5qNZanLCvxzcGoq
         rBJeU4miH+dKUQRwCzdIexo3mUHWUIw8QQHk6lKgkhNnAl0ae+fhPz/fE6DBB0t00q/d
         sgFJFmew/4asrGpD4g/nts6bArl9NWE4VpgU/yxvOKWEbqIBC7ON8lmmsgjtXptWNdqE
         /1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783633828; x=1784238628;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZU1CA1cQeL2WvZUsAarUegvdKd7AYzS4BOYt8+niWY=;
        b=PdAO7loq6HZzldHyOvdSCRvh7DWYNW8yd5Vcus4XoHnLltr8HYZ7klgJAdlpY5nwIX
         8Ob33pRTYTvTrpxbZ2rxWKErNCpYrEYAgtIZopcDzWDaxYOTl1cFfzOisKWWK3lLSXaW
         fTnEZCZwwSArsuEOefk78P4Zj79gANIJ0iNVkr0TaXMZxjG14JYAGzvAQB75o/Ov80dK
         TrQ6OpxXQibLFL437q5iw8dVyGZeKGSpZwP0YCot3IfryE5pLD2CZEQyxTtTitfMP+J4
         733BbJL2ENDq5GYd6hDurs6uxhce9BkDp+zv2AGLhr5E4pLCOwGtx5bajUfvnB8+f/9P
         ciEQ==
X-Gm-Message-State: AOJu0Yy5aRBd87xr2fuW2u1IReqL9ilf/f6IYJeknJ4Z8JArwBlv4GX+
	pbL9clgv8k32QrOwNQLOuVxNtbw8QFtJvoeEyRf34iPZ9Zgi+vxqODzfeoRuaj1h+dyj9JT3h+C
	HTRINnX+AbFip/7/J8hARViE6BBuNCXs=
X-Gm-Gg: AfdE7cnFhJ+H93ZCfMIdXqd/TT9+cKTuv95+txo884c6Xrnh/pDVamQ7UmS8hhS+RMa
	Y43RsBjaORexb0vuX4g/qgET2eH/a1KqtiKJrgZJPmZtVn7/SkOOnHyDvbN+SswsOe98tK6Jq51
	0/toDU0vzLjEhB9xcOVbGgRNl724mMYdhvpsMeO8hkX8pyxZXlWU3TPKas3yt/Yqk67+oefOqso
	IPVuDWn9VUBnvxp6Hum5V4ELNvBzG+8eqP30d7v01IrYGM8KFUi7l6iHerRdJNYs8IVWe4egTNi
	7IQgfTM=
X-Received: by 2002:a05:690e:23cb:b0:667:8b90:3570 with SMTP id
 956f58d0204a3-6679f26f8dfmr4940312d50.98.1783633827971; Thu, 09 Jul 2026
 14:50:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260709155837.1879230-1-main.kalliope@gmail.com>
 <20260709155837.1879230-2-main.kalliope@gmail.com> <20260709161557.794E01F000E9@smtp.kernel.org>
 <CAMB2axMeZbxWry=P5JTVo_xDw7TUeUKdK6X0_LKjvLWnLJyHMw@mail.gmail.com> <DJUBOWHO347N.1EKHIDMTB7DSA@gmail.com>
In-Reply-To: <DJUBOWHO347N.1EKHIDMTB7DSA@gmail.com>
From: Amery Hung <ameryhung@gmail.com>
Date: Thu, 9 Jul 2026 14:50:13 -0700
X-Gm-Features: AVVi8Cf4Kfn7RAMd0LquKodZ2ffbhqy7yZbq71rdlefclCRwUQX49MGqTd6h5Bg
Message-ID: <CAMB2axN+ePA_eFKBMBP1kuK8yhr+6PhRmyjX3EDgYthkw4YdDg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 1/2] bpf: reject rdonly/rdwr_buf_size kfunc
 arguments that exceed u32 max
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, Nicholas Dudar <main.kalliope@gmail.com>, 
	bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2026 at 1:29=E2=80=AFPM Kumar Kartikeya Dwivedi <memxor@gmai=
l.com> wrote:
>
> On Thu Jul 9, 2026 at 10:01 PM CEST, Amery Hung wrote:
> > On Thu, Jul 9, 2026 at 9:22=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> >>
> >> Thank you for your contribution! Sashiko AI review found 2 potential i=
ssue(s) to consider:
> >>
> >> Pre-existing issues:
> >> - [High] 32-bit integer overflow in `hid_bpf_get_data()` allows arbitr=
ary out-of-bounds kernel memory access.
> >> - [High] Explicit 0-sized requests to kfuncs result in out-of-bounds r=
ead due to verifier BTF fallback.
> >
> > I also noticed the second preexisting issue when working on a patchset
> > unifying helper and kfunc handling. The patchset will fix it.
> >
>
> Exciting! Are you also planning to unify global function calls (and exten=
d the
> type system so that we have parity with what helpers/kfuncs can take), or=
 is the
> scope only helpers and kfuncs for now? Just curious, but I think it the
> unification would be a good base to bring their argument types and the ha=
ndling
> at parity with helpers/kfuncs.

Yeah. I'd like to cover global function calls. The incoming patchsets
will only cover helper and kfunc though due to the size of changes.

The basic idea is to have a common function call descriptor for
helper, kfunc and global function call using bpf_func_proto. Then have
a bpf_func_proto-based verification. Hopefully most of it will be
helper/kfunc/subprog agnostic.

As for the logistical refactoring:

- First step is to unify bpf{_kfunc}_call_arg_meta, which many
verfication logic {e.g., alloc memory size in this thread} rely on.
- Then, KF_ARG types and their verification will be aligned more
closely with helper's arg type.
- Finally, drop KF_ARG and unify core of check_func_arg and check_kfunc_arg=
s.
