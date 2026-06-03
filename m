Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFCF3DB307
	for <sashiko-reviews@lists.linux.dev>; Wed,  3 Jun 2026 21:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780521739; cv=pass; b=mVIorRdwnn3nrDzsJrLKBNHKYUiL0nY+9b1eLIF9v14RjVZJtzHjkwrNlg0AvO9QPXObPr6RHNJODzEJYbNC8dh6Z12dGqY/XZBbPbtVq9m1a13WO2vbFT5wKiberiswQLHLB7WiVN8tk3m6P0ptT17xI/y4narAJ3lchdDnUag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780521739; c=relaxed/simple;
	bh=RWNwgY6nvbkoNOyo3h3qny82YPNg10V89sEXAbS+GrM=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IFWVnY5XXdg53Qr+wQL1VR9o1kUURqyzy62gbwc/r4SWwip5caV3XC+U7L6qN/OmAhtqACnzaBOP+fX2StTwOetOtZG8cW/pyEKFUkMr5CBchJBsCY0WaVm880KwfPBTfps6JS783fNtT6QuWGfCrGTSs9N0Ggdr1c7vlmEtSFg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tsjgc6Ad; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tsjgc6Ad"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-137e75bcb5eso6075521c88.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 03 Jun 2026 14:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780521738; cv=none;
        d=google.com; s=arc-20240605;
        b=Ur8eB32+74GAqT93CpM4adKxgOiH90/NXf8+O9tYffcesa0XjAsD23cH1COTNTsgZ7
         QXRPK9xN+v+DjEmUk3tlXfVpDiiUAqL3tiq/hMQrgRQYdTGEEADDt0/NRAHCfLnOftQ4
         NNe6MxzsWqswS9qYf2vUQkIBiLCE20e9dj4oK0pfQBeNHqYy4HxxNX4CX9Lr4yzMu+2P
         A6rM/r3/0YFBNC9DcXt9Vo4aVJ0pxOHGS9QHT4vlNeA61KyuUW9b/2HOnbL9EbVHnK5G
         YvlEtuz5KGMoh3+AWyJkEvv4JZiwLHprrbNsreHQeHgsb/BCPjGBg8WWQ3G1d5HP8J42
         lE8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=f3cu2RPTvjqp0oeoiNIdRmHOIl8ZKDXHQ5y2DINTJSU=;
        fh=KVy4+j+TE0qJlGnL1oxDtQvAs+ZlkPteDJwxhHS2piY=;
        b=HZOQqqB76rVjuJ0aHZjZEtG5/hHj1euDk1/4w6PNJkAQtX8JeG3J3v+M4Dsf7Patwi
         VDIiaWHO9hQf82COATOy45BFikPPafZJEFRLWDcYH9l0SS6QrspVVnTsFUx+Z226Vd/T
         cDDLn6d/xbDR05GroRtmHrDdb6mzqfspeIXbRwcq2+iBzL098BWH3f9RO2yxDlXXcv/K
         y2r8uhjxzkhJCdh6Kjvx33R3Zs0MJnHl/3qV5//nukxDsCGcPXwv1+JMRCRNn9XEf2SU
         LslACEktb9//nR6Rbr726SoXbxqlCnZ3jFnr5lbm1zJwZVg6EabLpFwOMpIbwLAnaGt3
         +/hw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780521738; x=1781126538; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3cu2RPTvjqp0oeoiNIdRmHOIl8ZKDXHQ5y2DINTJSU=;
        b=tsjgc6Ada4m4GrUtzS8ng3VcgC2Xlh5K+KBN6MbjFMBjy0dtbLUQzNk1nqklZ5M9m+
         a9TLSv5lnjFR6Hz6Cbf7by8/lYZas0HoO14tuTGKZk31u1h0XpNeqOcFv7OLyoSI7Xcx
         o3/b79CSBcp6VebaX6ZUSUNAgrturqp2l10SPxXuK6dXN8CBGRwanqaB8L79QFZDkdhY
         JFUtjWXh61AlYs7jZbGuOInlDkyObXTq2DAMqhns/K0+2AeXF2N0GPPbTMZ3oQcagMyC
         cjcTH697asxn5QTChNlfEjKzul1v20SrqGrdfyKP+wiJt2aDUkUTspaO29eRrvuEef/f
         wPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780521738; x=1781126538;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f3cu2RPTvjqp0oeoiNIdRmHOIl8ZKDXHQ5y2DINTJSU=;
        b=q4Jv4h5OAZ76y6BhmPLhRzy0OR0J0gKuDdgW7qvybPQiIalbRf5uWP6xhWR5yiloxI
         DdWB77RmrlDpVG7hR+KiQheD+JtE7B3sLRaJGCAhw5jHNDErJoqwTqELIoc7E27wYvKn
         LCLEnTw2Gl9jrzJIX7kb289W0sNUb3zBeFiFTkD+0olJktqkW8WL6ySFNvCSpe4A+mbb
         e1cRhrflkzVfW4kba93ZGfa8hcoJazsyAeFEjDnBtTBfbnjBQqZGn+ucdwprBIXYp+NR
         rZUlTVulm9WWunGpJwFGAaYOBS/eoIUBk98FzJ9QFRYEkOiCwRdlZTih0j0Juj9EXwVn
         UtwA==
X-Gm-Message-State: AOJu0YzI+bNem7UZtUS+B/vd+N6RBrsXvwu0cixOXPKeKykFQh+KT2HX
	ilOO5//HejhDe+yOcV4xLNN/tTgxx8P9FQG0PHw4ezG9JDWQN5H/LQU7+p1sxLXHQ41/ASlCn1z
	5ewiQwzDQoel35fNN/6x4W0vM4y9xLGqUFOoM88r9xm/PvlIZ7ILBfTJb
X-Gm-Gg: Acq92OHdI8Lwjpr71OKFxx+6EjmOmkI6AV4YVL9ixC3rT9/jwOQd47hSr/OdtUO05mA
	xn8HKFgH9ouNcRqjk7/ZggGb62iDOGBOWmHuSHBFCM2bLmqnTeffplz+4/nINX0p2schpNjI4HE
	Idxg+7JAWhiYIO/0ntqsrmt+9bqj8NKBrRcIincP3klq21SFSqBDlxWN15RoYRejfDazq9/2Z1L
	BdhMXVwqaojREFxafAyncDVCxBK5AB7jB0xkoNDEpsuTkeYUqUo0QyYV6lhPkBlVlt1rU0SZ5Jn
	ZrGtGyGRksgGnfNmf1dOVHwFTaNPi0Is2xuu/zSr6tszuCccRjTCDhBvI94VzorIlt4oEqN7kwQ
	jaVhG
X-Received: by 2002:a05:701b:4185:20b0:12a:6fb7:87e3 with SMTP id
 a92af1059eb24-137f6bd997emr2010151c88.31.1780521736748; Wed, 03 Jun 2026
 14:22:16 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jun 2026 14:22:15 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 3 Jun 2026 14:22:15 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260523010752.CA7AF1F000E9@smtp.kernel.org>
References: <20260522-gmem-inplace-conversion-v7-21-2f0fae496530@google.com> <20260523010752.CA7AF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 3 Jun 2026 14:22:15 -0700
X-Gm-Features: AVHnY4JrVmBL-PpY_h76rfTQEL1WoGJxRizc7dL5aP2fkeFucmBAUIPr9JBEYsE
Message-ID: <CAEvNRgEVC=fFuKVgZYvWyZD7t_zvUZihFG8hrACjvtkD5cwugw@mail.gmail.com>
Subject: Re: [PATCH v7 21/42] KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
To: sashiko-reviews@lists.linux.dev, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Critical] Uninitialized host kernel memory is disclosed to TDX guests =
when performing in-place population.
> --
>
> commit 38e76d2ce3c699d4b64b580ab16a7b4cbc2b189a
> Author: Ackerley Tng <ackerleytng@google.com>
>
> KVM: TDX: Make source page optional for KVM_TDX_INIT_MEM_REGION
>
> Update tdx_gmem_post_populate() to handle cases where a source page is no=
t
> explicitly provided. Instead of returning -EOPNOTSUPP when src_page is NU=
LL,
> default to using the page associated with the destination PFN, allowing
> in-place memory conversion.
>
>> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
>> --- a/arch/x86/kvm/vmx/tdx.c
>> +++ b/arch/x86/kvm/vmx/tdx.c
> [ ... ]
>> @@ -3116,8 +3116,12 @@ static int tdx_gmem_post_populate(struct kvm *kvm=
, gfn_t gfn, kvm_pfn_t pfn,
>>  	if (KVM_BUG_ON(kvm_tdx->page_add_src, kvm))
>>  		return -EIO;
>>
>> -	if (!src_page)
>> -		return -EOPNOTSUPP;
>> +	if (!src_page) {
>> +		if (vm_memory_attributes)
>> +			return -EOPNOTSUPP;
>> +
>> +		src_page =3D pfn_to_page(pfn);
>> +	}
>
> [Severity: Critical]
> Can this sequence lead to uninitialized host memory being exposed to the =
guest
> if the guest_memfd folio has not yet been populated?
>
> When KVM_TDX_INIT_MEM_REGION is called with a NULL source_addr,
> __kvm_gmem_populate() attempts an in-place conversion. If the target
> guest_memfd folio is unpopulated, __kvm_gmem_get_pfn() allocates a new fo=
lio
> using GFP_HIGHUSER, which lacks __GFP_ZERO.
>
> Because __kvm_gmem_populate() bypasses the normal kvm_gmem_get_pfn() zero=
ing
> path (where clear_highpage() is called for !folio_test_uptodate()), the
> allocated page contains uninitialized host memory.
>
> Since src_page is set to the same physical page here, will the TDX module
> read this uninitialized host memory using the host KeyID and encrypt it i=
nto
> the guest's private memory space during the TDH.MEM.PAGE.ADD SEAMCALL?
>
> Could a malicious unprivileged VMM exploit this regression by passing a N=
ULL
> source_addr on an unmapped guest_memfd region, causing arbitrary host ker=
nel
> memory to be disclosed to the TDX guest?
>

This is true. How's this fix:

Author: Ackerley Tng <ackerleytng@google.com>
Date:   Wed Jun 3 13:24:56 2026 -0700

    KVM: guest_memfd: Zero page while getting pfn

    Move the folio initialization logic from kvm_gmem_get_pfn() into
    __kvm_gmem_get_pfn() to also zero pages if the page is to be used in
    kvm_gmem_populate().

    With in-place conversion, the existing data in a guest_memfd page can b=
e
    populated into guest memory through platform-specific ioctls.

    Without first zeroing the page obtained using __kvm_gmem_get_pfn(), it
    might contain uninitialized host memory, which would leak to the guest =
if
    the populate completes.

    guest_memfd pages are zeroed at most once in the page's entire lifetime
    with guest_memfd, and that is tracked using the uptodate flag.

    Zeroing the page in __kvm_gmem_get_pfn() is chosen over zeroing in
    kvm_gmem_get_folio() since other flows, such as a future write() syscal=
l,
    can get a page, write to the page and then set page uptodate without
    zeroing.

    This aligns with the concept of zeroing before first use - the other pl=
ace
    where zeroing happens is in kvm_gmem_fault_user_mapping().

    Signed-off-by: Ackerley Tng <ackerleytng@google.com>

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 2a719faebed8a..7b1f2f0288640 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -1140,6 +1140,11 @@ static struct folio *__kvm_gmem_get_pfn(struct
file *file,
                return ERR_PTR(-EHWPOISON);
        }

+       if (!folio_test_uptodate(folio)) {
+               clear_highpage(folio_page(folio, 0));
+               folio_mark_uptodate(folio);
+       }
+
        *pfn =3D folio_file_pfn(folio, index);
        if (max_order)
                *max_order =3D 0;
@@ -1169,11 +1174,6 @@ int kvm_gmem_get_pfn(struct kvm *kvm, struct
kvm_memory_slot *slot,
                goto out;
        }

-       if (!folio_test_uptodate(folio)) {
-               clear_highpage(folio_page(folio, 0));
-               folio_mark_uptodate(folio);
-       }
-
        if (kvm_gmem_is_private_mem(inode, index))
                r =3D kvm_gmem_prepare_folio(kvm, slot, gfn, folio);

>>
>>  	kvm_tdx->page_add_src =3D src_page;
>>  	ret =3D kvm_tdp_mmu_map_private_pfn(arg->vcpu, gfn, pfn);
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-gmem-inp=
lace-conversion-v7-0-2f0fae496530@google.com?part=3D21
