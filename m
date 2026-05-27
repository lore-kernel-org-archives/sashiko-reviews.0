Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB0B17A30A
	for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 23:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779924705; cv=pass; b=fUVpPlx/GX+q9nFNM0B/P9SkX3M+Ed620bu6kYa/pLBHJDwDjESG5tWcwKYbTgCxOvW6xvGkEipGw9/y2j2zuPPcnpe4ekTRUX/yC8C9XBPe1k1BQByUSIhHa/7vuwseOPMbHV+aOhkMgrNVt6a1ydktATrDG7I6TXbJ3U2gswA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779924705; c=relaxed/simple;
	bh=FY5kRXN4HxQf8uvWx/WNrgDa70/IQkpHxs2C5AfvEZA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iqWlHszWQTj/mkIPPNl416yk8nZmNJgX+gledh0m4r0ALQdHjxV9mICsZtt7C/5lLqIMIPSDf3YPmiS/CLO7X46G7YaWdAqPY5rDUUE022O2EFcWC1GQ58E7cvekeHER1q5zON2Kxz4rAVp0WJIFWvZ36nrXgoVV6ienyPvqR9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kUZ6eE4b; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kUZ6eE4b"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-134fe980658so14181345c88.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 27 May 2026 16:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779924703; cv=none;
        d=google.com; s=arc-20240605;
        b=hod02L/DM7npeAH33HdlbmgYmhCvE/RR/aahgAmcbNdUZHWPjHLXS/YuSf1ISsMU78
         HFx4XQGqmCMc+vZDAZTyLSsIA7WLYyET6WuM/vNmXfJ4cgVTtzQx63cqWrs+QeZARNXV
         mjnxv1ZABGhZYvB1+Jc5txT7jd8mNAxm6MolqKyIVaRmtsAbWLzrjiOK+QuP5BzqJ8e2
         TPJ0V0ciPcCY9otlEhCvf34/PZgIWT6LKUtxfD2DP+QmMVOvDwQ4NyCPY9TPfKCqKpLk
         8zryBnGLmiLdJ0IJLOOM2xD1FtfYMqK/PuyegNIv2TmMj4uq+cCOcSDZTcsWszim9yX4
         z93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:dkim-signature;
        bh=Obtu6u3O3o/o4dgX8LFuxYSOq09LDgKPPUPR2GIgz6M=;
        fh=KVy4+j+TE0qJlGnL1oxDtQvAs+ZlkPteDJwxhHS2piY=;
        b=dyEUHWQwFv0JHwX7boADKJHCtoKPNVQl0S7oPlxep0uOxh3ZojqKDBJ2RcnG/l37Mf
         77PsLqS8H7fTwnrRbVgTxFEntNBbx9uIsAXcFu1mtl8AepjJOQHsXi6XKshPSTNhTfRL
         BypTog3iI/Sd3iyj1PonX7ALz9xT5G7r9m15XOqxQCV/k47It7T4ekCE4ov5xUUYIQMe
         yseoo7TxICSmMZ8/vxISMWezUz94Pr+pKsWADLKJSRPk/f26t2X7DyXWCiGKnPUgy23N
         V+CMQnt2ml4Jorg+c877a4NmXp7H6/ChZhwzhVsW1NJxp5RmXM02O2WM3gbva0ILGMAX
         FL+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779924703; x=1780529503; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Obtu6u3O3o/o4dgX8LFuxYSOq09LDgKPPUPR2GIgz6M=;
        b=kUZ6eE4bG4YHi5ZwXMdsKHyo3BQOGiGu+Z9W9dA4/5gTeJ2a3je/31HrS1LtdFQ9a/
         ZbHjRJYxz+CZ8YgcDNCXgXRdsPxpQ+X4oO0pPVhX+LVAh52XkxKLe3F8Yhsprks3v45z
         vx82Jx+f5aaNI1p9Hy5lpRW46zWsNES5He4fCkldnT+04w1QxTZ55a0nCGisKLZMQ4dJ
         E1oNDgX4HzsM+YfefUxNRT01wNxxb5iizhan8IBGVieduvfo/doBk7wfFY8/oA0PCiu1
         GLLUR/ADGwjsS9uPDabA7v/BfKl/xqeSiLY8LfZNWnJgsyLHxbeXJnGon4GIRmmFQT2f
         fySQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779924703; x=1780529503;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Obtu6u3O3o/o4dgX8LFuxYSOq09LDgKPPUPR2GIgz6M=;
        b=tPYPvhUNZUWrXkV91QU3MJVykrukkB11STfDs2+189Cvb/brTyhmoDHWaApkQnD1zZ
         q4xWAJ18UDogAxX59IGS7FvxwOP27RUGrqkTkVtTGx7McVrCNrEugsAmg0PXrruZwDW3
         FT33MqQY1SIV3IrVRB43sjahqjM2bzk+UKAL4x+yE0OsEuJHIS4rN7ndpmgdHFKuULOA
         8yMyDmuYvoBMe4w86L6iIx6NxGQoW0HmP/gC4xvDkiM50oXlKEVVCcgP2VJ+RrcJMqTe
         r7mqedYOlBZrutxZFMUgkNyepRBNMLSBi9Bh+ztw1Icgx1p/vACSEscKBTrDdb+9PjpA
         cFFw==
X-Gm-Message-State: AOJu0YwELmVdcskrtrmClAD1lJ0EkBybqm4CjdIahBmwydJ3d1oeruaP
	fo1FxwqtGAtcp8TW+kvd6qOPHs2QSaPgcuW9hXIWKIWVkNAL+oA8ptZ1TAiStN+65TOYan/w4Sk
	LhoZng1ZmPZwy1S8j1SFPhmVEV7To2OelsHem6jM5U6kC0oH7IgODczI5O1U=
X-Gm-Gg: Acq92OEOXTHylTV+o4hZh+BVN16pKvSSAynpq84kPjz1dEppSwfnZlivdT2HzIriU0v
	jHdw50nLZwjvj4IS38izQfuy2IGyAezQByJxHPEaptQYYaskF+eo7qNCB4i3LQojy5zO87KNF3N
	xxWygWubTBVJSaIaA0szkfSysY3/lChZT9gpgA8GnQcpnwLbMgrY/+D371myz4NinY18gQ6vbed
	FMevBk8MQnmUc9oac7b9xKgs5+sF1nNgTRbFjtCwDnSfElo2hBDijycyw4o55MrST9csN63IFwY
	fgiMwnFI1q1dpy+rmX2Ptg/ln+nb4wkDDszEPgfNJFLTwH45uM+i6g4Lh9VOtjhgn4j5mYkEClx
	dorc=
X-Received: by 2002:a05:701b:2612:b0:130:73ed:208 with SMTP id
 a92af1059eb24-1365f5f3689mr4745492c88.9.1779924702943; Wed, 27 May 2026
 16:31:42 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 16:31:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 27 May 2026 16:31:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260523005532.4D0DE1F000E9@smtp.kernel.org>
References: <20260522-gmem-inplace-conversion-v7-20-2f0fae496530@google.com> <20260523005532.4D0DE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 27 May 2026 16:31:42 -0700
X-Gm-Features: AVHnY4IbNlZ1RTod9euztnDIZ2uULN1-OWvv6seFfFHUYB_hs4gByAgHjLh9_vw
Message-ID: <CAEvNRgH_=OYjJzk9__7nXWvxJS9wZYwy_T+jD9KOYocP_s21Ug@mail.gmail.com>
Subject: Re: [PATCH v7 20/42] KVM: SEV: Make 'uaddr' parameter optional for KVM_SEV_SNP_LAUNCH_UPDATE
To: sashiko-reviews@lists.linux.dev, 
	Ackerley Tng via B4 Relay <devnull+ackerleytng.google.com@kernel.org>
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Missing FOLL_WRITE pin allows unprivileged users to overwrit=
e arbitrary read-only memory globally (Dirty COW style vulnerability) in th=
e CPUID error path.
> - [High] Strict LIFO ordering violation when unmapping local pages via ku=
nmap_local() in sev_gmem_post_populate().
> --
>
> commit feb1b4a1de59f0eb64cbf36005ae06dfcdb9b8de
> Author: Michael Roth <michael.roth@amd.com>
>
> KVM: SEV: Make 'uaddr' parameter optional for KVM_SEV_SNP_LAUNCH_UPDATE
>
> This commit updates KVM_SEV_SNP_LAUNCH_UPDATE to make the uaddr parameter
> optional when vm_memory_attributes=3D0, allowing guest memory to be
> initialized directly from userspace. It enforces non-NULL for
> vm_memory_attributes=3D1 cases and updates the relevant documentation.
>
>> diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
>> index 940b97d4a8523..107c6ee60472c 100644
>> --- a/arch/x86/kvm/svm/sev.c
>> +++ b/arch/x86/kvm/svm/sev.c
>> @@ -2390,7 +2398,7 @@ static int sev_gmem_post_populate(struct kvm *kvm,=
 gfn_t gfn, kvm_pfn_t pfn,
>>  	 */
>>  	if (ret && !snp_page_reclaim(kvm, pfn) &&
>>  	    sev_populate_args->type =3D=3D KVM_SEV_SNP_PAGE_TYPE_CPUID &&
>> -	    sev_populate_args->fw_error =3D=3D SEV_RET_INVALID_PARAM) {
>> +	    sev_populate_args->fw_error =3D=3D SEV_RET_INVALID_PARAM && src_pa=
ge) {
>>  		void *src_vaddr =3D kmap_local_page(src_page);
>>  		void *dst_vaddr =3D kmap_local_pfn(pfn);
>
> [Severity: Critical]
> This is a pre-existing issue, but does this write to the source page allo=
w
> unprivileged users to overwrite arbitrary read-only memory globally?
>
> kvm_gmem_populate() calls get_user_pages_fast(uaddr, 1, 0, &src_page) wit=
h
> gup_flags =3D 0, which explicitly does not request FOLL_WRITE.  This mean=
s an
> attacker can pin read-only mapped memory, such as the system global zero
> page or a read-only shared file like /etc/passwd.
>
> If the SEV firmware rejects a CPUID page (SEV_RET_INVALID_PARAM), KVM wil=
l
> attempt to write the expected CPUID values back to the user-provided page=
:
>
> 	void *src_vaddr =3D kmap_local_page(src_page);
> 	void *dst_vaddr =3D kmap_local_pfn(pfn);
>
> 	memcpy(src_vaddr, dst_vaddr, PAGE_SIZE);
>
> Because kmap_local_page() creates a direct or fixmap mapping, it is
> inherently writable and bypasses user-level read-only permissions.  Could
> this allow an unprivileged attacker to map a read-only file, pass it as
> uaddr, intentionally trigger a CPUID validation error, and cause KVM to
> overwrite the physical page globally?
>

Fixed in https://lore.kernel.org/all/20260522-fix-sev-gmem-post-populate-v2=
-1-3f196bfad5a1@google.com/

> [Severity: High]
> This is a pre-existing issue, but is the unmapping order here violating t=
he
> strict LIFO requirement for local page mappings?
>
> The kmap_local_page() and kmap_local_pfn() mappings are created in this
> order:
>
> 	void *src_vaddr =3D kmap_local_page(src_page);
> 	void *dst_vaddr =3D kmap_local_pfn(pfn);
>
> But they are unmapped in the same order:
>
> 	kunmap_local(src_vaddr);
> 	kunmap_local(dst_vaddr);
>
> Unmapping the older mapping (src_vaddr) first causes kmap_local_idx_pop()
> to incorrectly decrement the kmap stack pointer.  This leaves the newer
> mapping active but marks its index as free, which could allow an interrup=
t
> handler to overwrite the active PTE.  Could this also trigger a
> WARN_ON_ONCE in debug builds and crash the kernel if panic_on_warn is
> enabled?
>

Fixed in https://lore.kernel.org/all/20260522-fix-sev-gmem-post-populate-v2=
-4-3f196bfad5a1@google.com/

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-gmem-inp=
lace-conversion-v7-0-2f0fae496530@google.com?part=3D20
