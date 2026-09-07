Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D9238737B
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 10:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776006; cv=none; b=ccB7y4BdUrhjcd0ZGxZaP1wso0h+RyYUrr5QC5w3+gz19GVexmhC4bm3c/pha/+fdpBsQTViRSGONn6VOtSLVHL37IBAGKurutujM7GJc343bTwF8zc1qpo1Qu9VmkqU7pEQdO+tkr2ZXLrj/1ItZAdqbw34y+yPf9khhJ34mjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776006; c=relaxed/simple;
	bh=kwSRFB6k7ItQnpLwWCQSXDIvf7Rf9MlEIuIPfK0wwm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQSqZ7y6Jgq6eGugNO5GzhPZhCwbOS/bxkOYevLKfJNSkHZgd6WBMMEh3PK4Cg2HeQ07k2jFI9NgvoLCoS0TiBUEX7Zlm1RDOSogV5G7pYdQQNSjf3jyx/L1BTUYJao51hm9p7Q5NqOhe2qtY/zL3NcCTapcf1G4S13EynZS4Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RI3D2xCj; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RI3D2xCj"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a7ea0046deso4176231a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 07 Sep 2026 03:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788776003; x=1789380803; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mCouEmK1v28vcP6B5gyWqSemurFnzRz5qnbZvA4aPCU=;
        b=RI3D2xCjNzHtwdZZ7XdWZA1LPj/Yk2CzRPzYHN76D1H6ScyGDllsVI+/Ke0rSYYIKU
         GszhaCQLdPV9Lg8p7e5ygrTJN8vikjgGVwRn1mJl7lS8xsg9gwcPpy50v4eeTesQDF+L
         0fItwLG9/Vj73hQmPZSGw7qMb0JFflhs1e3bFprNVyZNR/WsMYvOb1w1kM6xeDLYPPzx
         2E3/AN1ivoDv2gdupMKSJ5emnPjNE3dqU/CxO5ePn80x/Lyi9qUlYg9pnjK8HVzL3csL
         heWPEu4gHojcSx99/uftAxRfgxx8RwveBFpj8nXR44rKtG0qF+nQ9unO+PTzYvmZXo1g
         ubAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776003; x=1789380803;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mCouEmK1v28vcP6B5gyWqSemurFnzRz5qnbZvA4aPCU=;
        b=jPZVWseoNEQcSDX1kypYcbeaSzFocZivI1aVwTije2L5t2P4qKaTSwWoY9Agg947/e
         XRh9BZDbOyy903Ws0zrVIa/gwpe0KeDQ8sGBl86YlELn5sBkudsmY9ah4BDHuwlx7Tok
         M4Cd8Q+2BAL4IVneMgjlLkwsdd+KSuxfFBfiAN0cRrMUQuVtFX5aXEeMculdBYJx9RF5
         lU4hTjU/yeD0zILOn11Ml5p6xsinDbqDo4tL4S2egXj6Jqj9ACQhQ85MzO+O1HLnCskz
         KKjyzNS0ueaEsWIGeMDiaGbPLn+1aqOOMuGjPJRW0Z4HBRchPwYwsILgbfmOU6F6bMLs
         nTBA==
X-Gm-Message-State: AFuF++k4NBbeBJsPey+qnPqol8HkWnzwNlOU9qVTSkiqtMbDy+RntjVH
	z+m48vwHTMEMIqM0f1wbCBsBm9slyScwmzkRpc2+l8RNGa5R9q56OWtx/2rlZk982qdM86xyMSG
	oUe3NSA==
X-Gm-Gg: AYBFou06f8OBkYLf+nT4hwo/VC0nakYhvTqpa41aKRhhcGTB7PvFBl73GLzV12lssVI
	5JnqviFA6UBxDGs7FuGi8MVlAtqIKQsrBcjivJ6cML1NUv6hccGbFiDBWfwx4nyW4ZIYUZMS50H
	BcLr2Bgb+33jwDONC+3gQFwFhz48aX4DIIHneaO5xD8NiIqMcMdmT/8+RUyJUqoeHJSpidykaam
	L/122BoNWH4/132909TGouK/IKi0QgSOIMBOeU904JVLPqmkI9zI+6gT95AzvgL5sznjmiaeU9U
	2Y/HcQ1lBsa9gJw6eFWBkZLBaYHq3lr3fHyhBIVqK6Wtg+F9oyeOB83j/L7uptYtKQnRS1ZqXbh
	xiVSYuIIW8pOBpoD0IpQS39ycD21W/GJaCJK1Bn9LtWMrzWVBJ1SXymVwMvWu9Ned12YOmM+mbf
	UnIGSpZ/pmSJuNsHD3X5S+qgl7hMw3aHpQKZyfS4/e76TQKejx6/Wc6czBwYBVOiAM0Bv5yjL6U
	/TgyXcOk6GDyixUS/0jJarIi06cjazn
X-Received: by 2002:a05:6402:4150:b0:6a7:ee56:8150 with SMTP id 4fb4d7f45d1cf-6a7ee568298mr6387365a12.30.1788776002246;
        Mon, 07 Sep 2026 03:13:22 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6c1bee2sm4136565a12.29.2026.09.07.03.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:13:21 -0700 (PDT)
Date: Mon, 7 Sep 2026 11:13:18 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 11/20] KVM: arm64: Add a range to pKVM ownership selftest
Message-ID: <ap6OPlYVvqbmAoGn@google.com>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-12-vdonnefort@google.com>
 <20260803104848.EF8BC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260803104848.EF8BC1F000E9@smtp.kernel.org>

On Mon, Aug 03, 2026 at 10:48:48AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The pKVM ownership selftest crashes the hypervisor during boot when testing block-granular ranges.
> --
> 
> --- Patch [11]: [PATCH 11/20] KVM: arm64: Add a range to pKVM ownership selftest ---
> commit e6586b2867cba4559d50173770f2de71da4f2380
> Author: Vincent Donnefort <vdonnefort@google.com>
> 
> KVM: arm64: Add a range to pKVM ownership selftest
> 
> Extends pkvm_ownership_selftest() with a nr_pages argument to test state
> transitions with both page-granular and block-granular ranges.
> 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > index a53600c853d4f..d5ee079a5d70d 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> [ ... ]
> > @@ -1894,10 +1901,10 @@ int __pkvm_ownership_selftest(u64 pfn, u64 pgtable_pfn, unsigned long pgtable_nr
> >  
> >  	selftest_state.host = PKVM_PAGE_OWNED;
> >  	selftest_state.guest[0] = PKVM_POISON;
> >  	assert_transition_res(0,	__pkvm_host_force_reclaim_page_guest, phys);
> 
> [Severity: High]
> Will this crash the hypervisor during boot when testing block-granular ranges?
> 
> When the selftest executes with a block-level range via PMD_ORDER, this
> assertion expects __pkvm_host_force_reclaim_page_guest() to return 0. However,
> __pkvm_host_force_reclaim_page_guest() hardcodes PAGE_SIZE internally:
> 
> arch/arm64/kvm/hyp/nvhe/mem_protect.c:__pkvm_host_force_reclaim_page_guest() {
>     ...
>     ret = get_valid_guest_pte(vm, ipa, PAGE_SIZE, &pte, &pa);
>     ...
> }
> 
> Because the mapping installed for this run is block-granular,
> get_valid_guest_pte() will return -E2BIG. This causes assert_transition_res()
> to fail, which triggers a WARN_ON at EL2. Since WARN_ON expands to a fatal
> BRK instruction at EL2, this results in a hypervisor panic during boot.

There's an order issue. Both

  Handle huge mappings in __pkvm_vcpu_in_poison_fault()
  Handle huge mappings in __pkvm_host_force_reclaim_page_guest()

Should come before this patch.

-- 
Vincent

> 
> [ ... ]
> > diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> > index a9645480d1648..4d41a16cd5962 100644
> > --- a/arch/arm64/kvm/pkvm.c
> > +++ b/arch/arm64/kvm/pkvm.c
> [ ... ]
> > @@ -274,17 +283,9 @@ void __init pkvm_ownership_selftest(void)
> >  	/* Memory for the VM page-table */
> >  	pgtable = __get_free_pages(GFP_KERNEL, pgtable_order);
> >  	if (!pgtable)
> > -		goto out;
> > -
> > -	/* Page whose ownership will be tested */
> > -	page = __get_free_page(GFP_KERNEL);
> > -	if (!page)
> > -		goto out;
> > +		return;
> >  
> > -	ret = kvm_call_hyp_nvhe(__pkvm_ownership_selftest, virt_to_pfn((void *)page),
> > -				virt_to_pfn((void *)pgtable), 1 << pgtable_order);
> > -out:
> > -	if (ret)
> > -		kvm_err("Failed to run %s (%ld)\n", __func__, ret);
> > +	__pkvm_ownership_selftest(0, pgtable, pgtable_order);
> > +	__pkvm_ownership_selftest(PMD_ORDER, pgtable, pgtable_order);
> >  
> >  	free_pages(pgtable, pgtable_order);
> > -	free_page(page);
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260803100904.3563942-1-vdonnefort@google.com?part=11
