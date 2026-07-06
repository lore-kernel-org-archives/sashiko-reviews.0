Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683E13B27F3
	for <sashiko-reviews@lists.linux.dev>; Mon,  6 Jul 2026 18:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361822; cv=pass; b=Apqj7cPSlq/G0KwC2FCrMO1ahpXKBldsK8KTAREEl6L30uJ06YkcE9jbR/z02qcTTbkGm9RSnVnT3n4t2h8N+f7XnnWxWgnzLnxqgjwgLyDUDwWwsoKV37Se1j3zAefKbUw0KhNZekR6tOj0hCzCrmILIPO1C6s2Azb5OGWLX90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361822; c=relaxed/simple;
	bh=JUjEMqmLwbxMJUgeUaMHMQg946Z1KoxX7FiJOR18dng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VtuptzUARsZQVmWxcqL267HsuJ2L6bwGaBIa8iCqK4E9lqLTW9mtCsueeVMFtdUSkshFk2hP0BQr+PtUMIDLmWImkNpnXPlpUY5AnqTjy9yGTvtfo3ScZZqUa2MVeq0hIRaMQsH8j6YzcCiE+wff53eeipZG0DkhNdGpv0OJDz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PCTGIvEN; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PCTGIvEN"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6647bc8f900so4500600d50.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 06 Jul 2026 11:17:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783361819; cv=none;
        d=google.com; s=arc-20260327;
        b=IFLi3neP9FceDF0+aw0oxCUY8ptWqjqox0jYGfXkccU/bcNJ/o7atW5Vy0cvZnSrXs
         p2CDg+W3NkUIz8/L29Lz0ju9PNJJcL/+8haAyuxvBA7DXfxJJWQJu9pk9zGqqzY+Fkt+
         TnCJpCrIBVfrhVgOJ2hK3D9b2UFqdKbdJjdu/qWpRLzy8na0rKTmK+Fq54PCZotllISC
         oyrySj0EBV01TABKJH2Nnq11XgMQZqrgIRLovoOgJFxTqhUF2IS2MxquBGByjJ7E2fKq
         HTtkhicmSgsMqOgGEhdJZfWk1Lns2m5B2AfgjHS6oIa3rNpGFiNEIx89xbg45hZS3XSK
         /y7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UlBknrTv2ASJSXzF6+Jo4USu59tV/IAMxbLniTjG/YU=;
        fh=uA360uvxR9S0K/Y4Lovo7aIaGlBwzVBnnb2BKWupr/4=;
        b=qb/WWNJ4R8jSH05cficF5JWwlVrVRuwz288rcYyTN8PbX7Lc6uNCKKalu1P8GA+rN/
         GouyTJavrf6HxtoNM3Qsv4MlOfISBlL+kRoZqTOLUVAH7duhdqKOIpkPY+PjVSm6e1m1
         TQ6QbaKZp5QwQ6poLqvexuzA2lAmyGPvJRRKrIJ4rpcliQWj/sffCe/AdKyQZ3boH9J0
         +7v44fmC6Rnv9L0dLVQj3kB6htNMugdyu/moEIqmUqzPZYj9ygfrq1lziq3nk3Fae765
         nA/+yMh5GhQC4bwRfJiYnvewErj04267lqCemgy4eH/u3axMdEYZTB7omIF4pEIx2pFi
         NqAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783361819; x=1783966619; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlBknrTv2ASJSXzF6+Jo4USu59tV/IAMxbLniTjG/YU=;
        b=PCTGIvENlx9VpmqHYyDkc1uw6UiJjF3olejLeJH8kR6dkVj7Y/kpEi2Vueyurxpj10
         Wa5xZsAA2zJLDnEmOlMzGBJlmrGpQm4146GAkxCpbYc0MgOk+l+20CDY5exrnBhVTgCj
         0QQqSvGTh31Ps7LK1J9N+iHtAJsxFIf3xspNMLVhLnlgWg6m4nqTvZg6x2fNLZmP8uME
         f1qBqOiQhVMca9biW6Psmf0q3JQKjCIJuXRlrTOXL07hIDzIZADIf51Vlw4yhqYb4+gn
         PVTfIMKvxBMiLk359YA/OvoMJmK8SdWyFZiaVoYQawdfkHyyHnrGvRG6l7Nq0AM89eLh
         uOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361819; x=1783966619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UlBknrTv2ASJSXzF6+Jo4USu59tV/IAMxbLniTjG/YU=;
        b=N6LRY5HuNHUDsevjkxcy0m7UkZZa4+k8s3U48eocV7raDuij95C8fMhLjkSEM82Q2k
         K8pp5MBVo6OZM5hwHOqa0hC7LqrB1H0/vKXnhv4S8zImIUGcUTHZM3bbJ59YysUJUEPm
         FGuFZ8J0eQTyPM6cKtUbx+bNTEdNP9APDBuvt2j6vXpR6vp3mDY89g+QUmXZBx5E2F71
         CqV/dP+lOmB17yQCLLHm7/zZ364jlaqei8XSseLT5KluQ295HkwPBTMjN+f4qZvGsCvy
         Dworu2cOUeJzP/dm3fKySCR7dVyVQfs1/KdJpI22Xwnxp/LPEpsazy3udD/b4U5IM0n7
         zHlQ==
X-Gm-Message-State: AOJu0YzXMJAk+iDjlT2h+LzFMT5om7ow0o4LVInBC5HHBhKbzjYUrJH+
	zt6OjdlRw7l17xiKWdJzQy+XMPldkghK3zO2zxSA0qP+SPx05hjciVSjvHR4GRxkhYLnALJ5ynF
	868iZvl2H50J56JwemviOgFIe39J44nN6svm2
X-Gm-Gg: AfdE7ckuwPWlN+51Ob58PZYRRGM9D/JA6DV0pQ/9vLNk5+43r0PSOfLwfj1m69oqWWg
	wM0ETo+kDsq66yXkMxX9VbhbIGA0XCxPRPr7APPn16p2kkBoWzU1QUBJC055if1oPDBdiZtvNw5
	k1VFyyc5NLa8bYkyLGvchiWQatGoAU1TyQFfgSOrlZQLtWqRw4ooVbhGOzlvsFWED4/y7xZnuUS
	/8Q4qsV3N1//bFvoUTqMWguiGpobU0/mHv+aQGOGuC02DHcJdpWV9VDy2lG7xoJFjbZwLtP
X-Received: by 2002:a05:690e:1183:b0:667:773f:8729 with SMTP id
 956f58d0204a3-6677fc8e533mr1600703d50.64.1783361819488; Mon, 06 Jul 2026
 11:16:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706171918.317102-1-ameryhung@gmail.com> <20260706171918.317102-4-ameryhung@gmail.com>
 <20260706173419.6F11D1F000E9@smtp.kernel.org>
In-Reply-To: <20260706173419.6F11D1F000E9@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Mon, 6 Jul 2026 11:16:48 -0700
X-Gm-Features: AVVi8CeI0q4ekJpH-zFiUMaXE2ABPNvFkjsLRgCZFGjDfhjCCxnNT-LntIzm_wY
Message-ID: <CAMB2axMsRM13Mx_xjRZAZmVEOPW8_=rU77BqgC8h0MXaw3mwyQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 03/15] bpf: Add bpf_struct_ops accessor helpers
To: sashiko-reviews@lists.linux.dev
Cc: bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 10:34=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] The function `bpf_struct_ops_kdata_map_id` is declared in `includ=
e/linux/bpf.h` but its implementation is missing.
> --
>
> commit 95521f3bc40fc850e1847bcb5fd4b12e698ebe45
> Author: Martin KaFai Lau <martin.lau@kernel.org>
>
> bpf: Add bpf_struct_ops accessor helpers
>
> This commit adds helper functions in bpf_struct_ops.c for the upcoming
> patch to create a struct_ops to cgroup attachment link. It also exposes
> existing validation logic as new helper functions.
>
> > diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> > index 91b8479121fa3..1a1e8d0885c8e 100644
> > --- a/include/linux/bpf.h
> > +++ b/include/linux/bpf.h
> > @@ -2252,6 +2252,12 @@ u32 bpf_struct_ops_id(const void *kdata);
> >  int bpf_struct_ops_for_each_prog(const void *kdata,
> >                                int (*cb)(struct bpf_prog *prog, void *d=
ata),
> >                                void *data);
> > +void *bpf_struct_ops_map_kdata(struct bpf_map *map);
> > +u32 bpf_struct_ops_kdata_map_id(void *kdata);
>
> [Severity: Low]
> Is the implementation for bpf_struct_ops_kdata_map_id() missing?
>
> The prototype is added here and a dummy version is provided for the
> non-CONFIG_NET case further down in this file, but there doesn't appear t=
o be
> an actual definition in kernel/bpf/bpf_struct_ops.c. This would cause a l=
inker
> error if the function were called.

I removed it in v3 since it is a duplicated version of
bpf_struct_ops_id. I forgot to remove it in include/linux/bpf.h. Will
fix in v4.

>
> > +void *bpf_struct_ops_map_cfi_stubs(struct bpf_map *map);
> > +bool bpf_struct_ops_valid_to_reg(struct bpf_map *map);
> > +int bpf_struct_ops_link_update_check(struct bpf_map *new_map, struct b=
pf_map *old_map,
> > +                                  struct bpf_map *expected_old_map);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706171918.31=
7102-1-ameryhung@gmail.com?part=3D3
