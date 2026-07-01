Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347A7386C20
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 19:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782934310; cv=pass; b=bnoRRZuXbgWcbnW75fky84UYx2RezONcKZAM8dPse5oV3skVlK7osheWihkLrqr0wJEp8/FrW9MOPmtbMZZ/CFzhXsoEKatOrCzizJHLhIyq8cindfIGqCZiakF84JC2S7Lh91dEIRhyPeE0ZixtB6AbAyK8p/TaWn/eMcylz9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782934310; c=relaxed/simple;
	bh=FYbU7ZZR1ardUu7/hnOPvsNdJaF1pTEctjOPw9zaRlE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j4mQ1ZolqfA/6YbLwM8yvfIKjrGLW6ayaLC1mL1KRwsRPJEsgFuIKIe7YJnIPgcG3ntJh+CLGmj0Im+ZpS/dgor97Zwl+Fxrgrtv3FI7uePcII77b8VcMAxPvpmo5UTtQN6W9+JK2tY7xLj3E/QgTKNawFUtlTsqS37dliqVvR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJJM3kFn; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJJM3kFn"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c9cb97e178so12042045ad.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 01 Jul 2026 12:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782934309; cv=none;
        d=google.com; s=arc-20260327;
        b=UWodp9cebMLci2RoDQwnrEQhG/1MB0L1LBblMp6TdrTwcaFsQVEm7vxxGrm7+p6+Hb
         z4c4ahWX6WYVzLeH0DM6EYar27aF8raC8pMaU7J+qwi+BqETq7mYbi0OGSEKJNyon2cr
         3BvLN8up7uR8Gu6gEYXH2+E63hl1jwWBAy4isJMf9O90IMNs/kqmtQBYxToXCoyowPY6
         dXz+/hL5IJs6qiz0dWra+qXwhveX1rtlgQGgAkojT9MkpZ/XBDGqANPPEo+NBtXHWCoE
         vtFS31TcxfzNac1WKQo5zb5s4I3y51Wb4SOirmw8ep63adxTGgRLHUGRDJnBDYxuFK2S
         ZWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MvSRxvWpZkkrTTRKKZ2eLhjlabjyjLbSMGPDu7w5z/k=;
        fh=YEWhegES1HoC1CaJeJoBadsdXWSH9ZJKvcZmE2GZrBw=;
        b=KWDh7URCv5JGnfEYV8eJPUwqn5XYkrUO/sxozug1Jm6159qYceyxdIbdlvj+nyNAkM
         e4BpprSaQtSBmvqOysU1FKJU017u3aBAS8EYj8bQnVNz6RHajKFY08c8pLWabMGM7cHD
         2QKYaK8bDttWL/kuuyDW6YMskY7qZYPGo1vHxDHJ6pNfhjajCYQiNDhauMdHyC+EhVBw
         /15UGRtbKLMY3jVNlOEn5KypAn6xccv/0f4TEo9nXAi04G2UYAcdU0coA+YOE2/CHvhq
         hMYugxp0I767nGLyUgG80+WUgesCnRmUTTj3khpQMzIHwwMQnx2JEpvfMZvKPEWvm90/
         YM2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782934309; x=1783539109; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvSRxvWpZkkrTTRKKZ2eLhjlabjyjLbSMGPDu7w5z/k=;
        b=IJJM3kFn+T6QwqIdrhwpBj1mw38hp1V2RBVg9Pf5CU45TwbqNJarmm9+SB9v4WSSQ9
         sTKyoKCRZYa1BJmRWUlVn8lPrZsqYwMPTNtXoV2DU3kImC3Qr2A2RlJP3CafllTKDeE4
         ycVRiDI/THJLH1WCYjUEcNSS2hdRDIuAJbLlWn+vEPoa5yf2LJoC9lZt7A/JeD1YWOF3
         0SwtnPfVphqnZPm7Y+nKOAtfZGmeqk1PwJDj6pKTfg8A8qK0xQMyAxByuJV9Lf77ITkr
         Ma8biJZh74vPx6ZLoKZSKDqakTE1GjAjod6JkUZ+Yd3cPQIe0l9hkJqKJvOcr/MVScb/
         JYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782934309; x=1783539109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MvSRxvWpZkkrTTRKKZ2eLhjlabjyjLbSMGPDu7w5z/k=;
        b=J21V/J77wvATisbBoV9frHxYeeRRwb30T2VuNsYetg8ETCfxkKxGCqZJUOwcsrbYGn
         B+GJ8VZSypSbrZMJ9w5YlC5iF8TeUSXyuBps563RwkDamfFRSqCTXjXrvD3lf1KxRz1t
         vYA/BR1HBNUutesRaL57ahbdYC71O9IuNtr6tTRLrxBH5qNlIOCjQY9TByPYjSkl/MWx
         yE+9htfRVnisz9bYW56gLWh2+N1pDBKoK8WPSy+QMeyD48eSNXb+5bABhnRBvpTBL3p6
         utS6TOYzNHpgSjrvfAYN9VUhZcxh/90cb3EDngHQO4on7//IKPF/mPjL5GydHzkT1IiN
         PZ2A==
X-Gm-Message-State: AOJu0YzJVkRlZGadAT5QlFQ7de5BbwqTrIlS5OOzTpurcD0uZxHH5L6o
	3iUZQNBs3vjQali/Ryd84Vbnc/IHziIXm3auOqI82HFAh8r5P7XHowToGH9f4sgxiCzPbd6Bt5o
	qBYzfpoeoyVWTVsa+hMliwRiO/8XLPU8=
X-Gm-Gg: AfdE7cnkT9eSSvH+P/VHlJMr1RjnFUBnef+h6tN0U1zN2dFKzeesy3elqpft0NHPlvj
	A2YQ857a3IKpjtlgTc5m2bi8icvpQescShZ3vgPE8+NoNGFUBzrf/KjpmxdBk9Z/LvkAPnkVfd2
	vmpK5DsPLBwoYqZOWNXBemfoeF7GVX73Bd5P3nq2V5PFgTcJOwCtspDf+PjAxjRampcUGR2r/tj
	iYeUzyrIvMPDDmlJrUCvFz8uzH3wwlfEkr/geHDLwvQOcdFtG0M50vr4uRzIZWLNU9oQetui5Is
	28vFeer9TV/cjkjhFL1yDS4Wcoc9Ehlbhd8yKAecKixDSD3ZpIb92A==
X-Received: by 2002:a17:903:1acb:b0:2c9:c54a:7915 with SMTP id
 d9443c01a7336-2ca91140306mr23456615ad.14.1782934308564; Wed, 01 Jul 2026
 12:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260629152406.52582-1-leon.hwang@linux.dev> <20260629152406.52582-5-leon.hwang@linux.dev>
 <20260629154055.6DD941F00A3A@smtp.kernel.org> <96cbecfc-bae6-46ff-90a7-5f4703e1c44c@linux.dev>
In-Reply-To: <96cbecfc-bae6-46ff-90a7-5f4703e1c44c@linux.dev>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Wed, 1 Jul 2026 12:31:35 -0700
X-Gm-Features: AVVi8CfISks_LG4JQSiNXyaFUKM0gRwVJ8fB6cCXJJRurC35m-YEQt8rS7IGXGU
Message-ID: <CAEf4BzbBpDQOG-xUArBzZa_qZ08q=QViH-bbFmqwLNesGvJLUA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v8 4/9] libbpf: Add support for global percpu data
To: Leon Hwang <leon.hwang@linux.dev>
Cc: sashiko-reviews@lists.linux.dev, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 10:55=E2=80=AFPM Leon Hwang <leon.hwang@linux.dev> =
wrote:
>
> On 29/6/26 23:40, sashiko-bot@kernel.org wrote:
> [...]
> >> @@ -1983,7 +1989,7 @@ bpf_object__init_internal_map(struct bpf_object =
*obj, enum libbpf_map_type type,
> >>      }
> >>
> >>      def =3D &map->def;
> >> -    def->type =3D BPF_MAP_TYPE_ARRAY;
> >> +    def->type =3D is_percpu ? BPF_MAP_TYPE_PERCPU_ARRAY : BPF_MAP_TYP=
E_ARRAY;
> >>      def->key_size =3D sizeof(int);
> >>      def->value_size =3D data_sz;
> >
> > [Severity: High]
> > This is a pre-existing issue, but could this integer truncation lead to=
 a
> > buffer overflow?
> >
> > If a user supplies a crafted ELF file with a section (like .data, .roda=
ta,
> > or .percpu) larger than 4GB, the 64-bit data_sz is implicitly truncated=
 when
> > assigned to the 32-bit def->value_size.
> >
> > This results in a smaller mmap allocation based on the truncated value.=
 Later
> > in bpf_object__init_internal_map(), memcpy uses the original 64-bit dat=
a_sz:
> >
> >       if (data)
> >               memcpy(map->mmaped, data, data_sz);
> >
> > Can this overflow the allocated buffer when parsing unverified BPF obje=
cts?
> >
>
> Sounds reasonable.
>
> The data_sz value comes from the ELF file and therefore cannot be
> trusted, as the section size can be malformed.
>
> For example, readelf -a shows the following for a normal ELF:
>
>   [ 3] .data             PROGBITS         0000000000000000  00000040
>        0000000000000004  0000000000000000  WA       0     0     4
>
> The section size can be modified to:
>
>   [ 3] .data             PROGBITS         0000000000000000  00000040
>        0000000100000001  0000000000000000  WA       0     0     4
>
> In this case, data_sz would be truncated to 1.
>
> However, in practice, there won't be larger than 4GB section in bpf ELF
> file. And, it is meaningless to hack libbpf to corrupt user space memory.
>
> Of course, will post a separate patch for further discussion.

No, don't. All this hardening of libbpf is nonsensical. libbpf is not
meant to protect against corrupted ELF. If you don't trust the source
of ELF, you should definitely not attempt to open BPF object and load
it into kernel to run with root-like capabilities.

>
> Thanks,
> Leon
>
>
