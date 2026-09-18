Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C58446072
	for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 18:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789754519; cv=pass; b=hw3FBnJLDyBSEWG7My9Li3AL9wgegdjF+C+rZKOFlAg0Z0IyIlb5RTr0fBAdMnmRbcdwXnr4P15OgmrOoV8NFFAL36jbCwcH5VqhBKxFJq3H5lDCXdDqb9kJbB71luAgP6pIzOF6zmkDz7BPITOS9I5JfQC7P8RoKNug3WZbJTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789754519; c=relaxed/simple;
	bh=D4aV9/V2T0lgtI47jW3XfRAs3J354z+O1K6sl0PCO8A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uEAVtqFECJexEpxkvzWhObR13VbUlcmzVlvTalNVNjtKwllwDR4ULo/7VC8nDcYpc2FBxQRPdTs74edBrkR2Ucal4rfBdLEMK4UaDPBkcbkjkfKRN7NqiL7MKETpJFqTC0stoD4hXvIG8BGhR9l2dF5VNfSClkluvQhunAREr7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miMj4aGw; arc=pass smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miMj4aGw"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0d1778eso589441a34.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 18 Sep 2026 11:01:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789754514; cv=none;
        d=google.com; s=arc-20260327;
        b=qDOQbAjiuOmfXt8TOM4gOyF/GpMR7uZcs/n7dfy4xmyhVZODqLoXFbE1xI5iYVFKxg
         Jo8brNGKPULiAiMLKC/Ql6+AyvBKIlluICd0bftjIRahVHdg9ZJaYwMylKuHkDmyKKYa
         edkitEHph4ExWB50xu+VflUCX1mYeABX1oVBNi6LzjHWT2z5KuwDFsimYbdh9z7BGV3g
         izCRvrqsWC2dVql7Qonwg5Ndydv+lm/6Wm/0f4ReHjGVRaRUpvSEi5DbrW3aagq4u2LJ
         N9yBTyVfN7GBVVFkd3BmGhOB07c2+IXzOdY4npcDoqcJSQbUozsiH2uU93qWN+IkA3Hs
         IHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NplD+iyuQz3OMkbtlm4TrefJDG7gfBsma8gEJO4G/yk=;
        fh=L7w7dTDeaoXI/cOn7H/Z6eRmWYJdMKqTNJVIj2dAHlU=;
        b=A8gLy2IEaXA4CKiK0v0wjnnp71v2/EwfR88LDdmMWCmrIp9YTUjQiWiZUG2cwPAm07
         SNUC3o+ENMhBd50RTd1ubXBTRib+FbAmQoLeW/wjFUviEPEA70cLp9iWBmFCJGW3HL2e
         zGMycv6MCLVzjRPHJ2esVJlmYdXz1bulmg6JXfAlsJj8yLDGotZHukeq9e8yQaNyHS4L
         n7EdomvnpF/XuNMLLTnw7/4n6mkN7A2gia0pujRaS64uQAKo9lGqEU5LpIu6z4tvoBAu
         1t0fP+YYJ1mpdxJFg/TVYIAU1gIde5msLpokUNmzCyijQ2EyGxpdOVSISGy4uDY0bVZH
         eF/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789754514; x=1790359314; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NplD+iyuQz3OMkbtlm4TrefJDG7gfBsma8gEJO4G/yk=;
        b=miMj4aGwigVOPJgXpcjyVA6APrlFubW+TPtCcDmb6zRZckUA9ty5tHOMLT+VGuaWid
         DNQrJol5PJleDX40LwDlKUPsGqY/y+B/HnyPRsD0MJMYlpKtA3OwgLZukqGuCs9y7nU/
         Mzp6dYXkBM6Du9VRUYbU3EbmTX49ER80F2EUOfdePR/gS6JnyACX1VgjwftXlNlH9812
         yG5ScRkLy8gxsFtr//p1HKxiNj/VXL0V0N3TKhTwh4bbCSclrR4AMcARb/CE9y6Hgcwv
         ZCzlfFa9qAFg+kosXKFeDrawqitUEBrxZ8/OLKEtPyEZp9RjRmZus+YySKteVY3g5il1
         e4oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754514; x=1790359314;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NplD+iyuQz3OMkbtlm4TrefJDG7gfBsma8gEJO4G/yk=;
        b=aPGAFwiqpnWzMf9NSiKNTs/X29W6kVyhip66LXixVrswy89kpEHqFVTJs5KbR/HuxR
         OOVsJB43nCBmDJC20A5+WYBhbGxCYXC0DnYZa4HFdMigTkm7QINWoD6XOAgN69y4HZqX
         eQhP3670vD/jZugGJZRrKH0Pn0S8IXApVXo4HMwk6RFmIcKMeU8M6x8yk4zwzqdyctxp
         XaIcrpVAaKTyGzR74BnBFICpHOIy+FX+z96Ud8NfXNzr8vWJN+I4suC+pPHzw9p+ZKeI
         64ZuCPv0jp/OBcNEqv984zUMKMYKN3HyF0RtM4HhdG1UTfQVVjh7Y5q6bg92P8rJ9qeP
         0d3Q==
X-Gm-Message-State: AFuF++my2mDasjwQUxDxTCSXNMm3GCqTemsYzIlSrExlHVYPCsm/fIYN
	0O5+OMbTGZnTu8bS0nkoF9DJZjY0HDH1Ag17TqT7e6qbOZvt2kH7kpKKfThP4XX2xlQRf+TxaW0
	oUZuXa7Eksg3658PV5JXE8D7Im+PWm/gyJ/M0
X-Gm-Gg: AYBFou07+4+qb6ZbQMDFccIzuDCbQeHXietUab4D+r8tBPMfBFgiY6kAD7eaDhqvReB
	GErZSKbgz0Gf85S7Q2v9UsywmAOmV8zflL8z/Tzp73jF+Tjpj/mg23DBBmrGgaMZzfaumSfxOv1
	cqRNGvFU+oRdEtM3FNze8RZNBCEpl3aN8b1ufEkiJcbaoeAEgAlWxX7Fm70CImHcY0X2CUFB6KW
	YBm13kog880HrloCrEQz5bX0QYraPLwbNgEg580ImDzSx7VMFiV7DHvW+WXwkYXUlKsBstPNu/H
	IhrVmArK+Of6CPVv6kQulwCAfHSNYfnQrGo+XCEaze/QVkuUwLFxVoqOpzv1kzY1ThtvMoI=
X-Received: by 2002:a05:6820:178b:b0:6b7:83c5:fdf7 with SMTP id
 006d021491bc7-6ca9c75016cmr3135671eaf.56.1789754514005; Fri, 18 Sep 2026
 11:01:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918052906.12226-1-memxor@gmail.com> <20260918052906.12226-4-memxor@gmail.com>
 <20260918055038.1D4AE1F000FF@smtp.kernel.org>
In-Reply-To: <20260918055038.1D4AE1F000FF@smtp.kernel.org>
From: Amery Hung <ameryhung@gmail.com>
Date: Fri, 18 Sep 2026 11:01:42 -0700
X-Gm-Features: AcwNN1Uab8kO1EQcD3nOtj9wZwXUV80qHQAweUeg6HNGFR-V75aFhIIx6sft2CY
Message-ID: <CAMB2axOVeCSWogRJn6z31J+4to6R2T7U97MEP-sAO6Zv1jeTQQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 3/8] bpf: Check read access for initialized
 writable memory arguments
To: sashiko-reviews@lists.linux.dev
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 10:50=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] bpf: MEM_WRITE without MEM_UNINIT enforces BPF_READ breaking=
 output helpers
> --
>
> commit aebadfb01a3b32540321fe2b60bcb6fb1c8673be
> Author: Eduard Zingerman <eddyz87@gmail.com>
>
> bpf: Check read access for initialized writable memory arguments
>
> This commit updates the BPF verifier to derive memory access types based =
on
> argument flags, correctly enforcing read access for writable memory argum=
ents
> that are already initialized. The change addresses an issue where helper
> argument checking previously omitted read permission checks on map values=
. It
> adds a generic func_arg_access_type() helper to replace the kfunc-specifi=
c
> access overrides.
>
> > diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
> > index 1d5e4ee64fc00..21eb806b1351c 100644
> > --- a/kernel/bpf/verifier.c
> > +++ b/kernel/bpf/verifier.c
> > @@ -8886,6 +8886,15 @@ static int process_map_ptr_arg(struct bpf_verifi=
er_env *env, struct bpf_reg_stat
> >       return 0;
> >  }
> >
> > +static enum bpf_access_type func_arg_access_type(enum bpf_arg_type arg=
_type)
> > +{
> > +     if (!(arg_type & MEM_WRITE))
> > +             return BPF_READ;
> > +     if (arg_type & MEM_UNINIT)
> > +             return BPF_WRITE;
> > +     return BPF_READ | BPF_WRITE;
> > +}
>
> [Severity: Critical]
> Does this regression break pure output helpers that lack the MEM_UNINIT f=
lag?

This is a valid concern.

I still think we should assign BPF_READ | BPF_WRITE to kfunc arguments
when generating the prototype, and only BPF_WRITE for __uninit
arguments. This would also avoid the need for func_arg_access_type().

>
> For example, bpf_snprintf() is defined as an output helper:
>
> kernel/bpf/helpers.c:
> const struct bpf_func_proto bpf_snprintf_proto =3D {
>     ...
>     .arg1_type  =3D ARG_PTR_TO_MEM_OR_NULL | MEM_WRITE,
>     ...
> };
>
> Because bpf_snprintf() does not guarantee full buffer initialization, it
> cannot be safely marked with MEM_UNINIT. However, with this change, the l=
ack
> of MEM_UNINIT means func_arg_access_type() will return BPF_READ | BPF_WRI=
TE
> instead of just BPF_WRITE.
>
> Will this inadvertently force check_helper_mem_access() to reject valid
> write-only maps (BPF_F_WRONLY_PROG) when passed to such output helpers, c=
ausing
> valid BPF programs to fail verification?
>
> Additionally, for unprivileged programs lacking CAP_PERFMON, won't this
> erroneously enforce stack buffer pre-initialization by enforcing a read c=
heck
> requiring stack initialization in check_stack_range_initialized()?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918052906.12=
226-1-memxor@gmail.com?part=3D3
>
