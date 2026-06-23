Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297D83AA9F4
	for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 23:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782258106; cv=pass; b=iw0aRyL12rAoAmRlzsQobmPexF5UrfbA9h6heVqJlY+s2AwTTvNmVEum6BahCwgxYXgNISHZtINcegCWXFfF80mDuYmSUj9O2wX3lM63C4SgQfLAT6XDXuCIUPPO3zHUlntAf+SeYnvnw04HJ2NidsdRkSRjNcfo0PduSCCmuHQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782258106; c=relaxed/simple;
	bh=0o2TLZAQfupxDW1DGh5utshxlDAHM+yJodjjXz1Q8ok=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h2Z0oJLuG7n7bZxWPIQFyrZ/XbIvJJWxdizOfA8rvnLp46ao6/GFc2gNLgLMiWWd8Se5y1d9VmCyLlMZr1SM9XYJQm/Q0EPDY/4GxdIqmKhUPpmKZbA2CekzNcMAWAsVO9GORgBDaWncE0f8mK/c+AqpTZ3oMJRB8dMui+XkH/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AOy4JPiG; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AOy4JPiG"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-30b6dad2382so746092eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 23 Jun 2026 16:41:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782258104; cv=none;
        d=google.com; s=arc-20240605;
        b=lomh6j1j7BYhjbyWSTpBHkdixTY4VZfbc3wcr5qmfUX9SGNWTmDcKSoHNtA1J+aLyz
         y4Zk3SzUasfJAy9UI0LecYoMvbwaDqA19uYU0HLmA7aEwMsfJ/2onQuuskjbcnxto9wj
         67HJiBDemrwGDvZIXbNqxVuT1fRx+PNiPwaQ/92K/6yoF8e55wzpWjDtx+rQUTzB+j5a
         U0mu5wOG7f0FeDoz83iEbkBkWwH0c7Aza2C0OlrM/iXePSoZkLaWe3BTXIYrtFJCZjjB
         Pdwd1zcBe388BFIyxJOlYyE9rPDufcnOVsAkv7xNADKAFoCXh7jrFWCMKfMYP9RLWuP9
         NYhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=5R4jJVdiiD97J3GTz0Op+QXJSLTSXOE5UM4tQq8YjrM=;
        fh=9JrxzEph8WKUSJCiqD9wCr7hpQ5Es4wJkpa9kaCGal4=;
        b=B6V1FtCNlI956UXMFee3oLX7+VF3Xs7R4i8vjc+LC1iUwD+VIN9rjEg2ZRjhhqccng
         Jv83AcGHHdEj2QBc6g+ANPLxBtylN931z3p0Ah6nQHTSvrZnCxcUUYUP+YROM7D7yvKr
         wu2omsb3ujK1PJyAlpVFT8HLPRoREzkp+CVLK+7KuaW9sblkwH2MD8LM5H12RhjplI1E
         eH4vTo2gxtLINge27Z6+apjGi6xW4mEUu7EqxdQ3vq5ILxZyqgJS9ULJ5hsAExQSL7OM
         PuPcbxtbIVSqBFeNidNVh2HscIKUg6ElzJX+44YL0jnlPD94zbwlj7vYL1pgOXIqEVAh
         MHKg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782258104; x=1782862904; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5R4jJVdiiD97J3GTz0Op+QXJSLTSXOE5UM4tQq8YjrM=;
        b=AOy4JPiGi+007uQckfOE6MJaayYLXOzU0R9skIh5Rqo225+bNZnCDvJA6+DN737LMT
         PkA13AZuON60W5vi+p9JeOScBpQKKlWjQ78bFtQunR20jxJ5r2JJObs67PcOXPbU4h39
         qWwjtarCVZrEy+QGBcPAiPpAzMlb0RFSXokGYTyEY3KLJgCZa8Hegb8VS5xHONCliYl2
         6ID6vnHvQaE0fpwqR82hLGAEIt82dKZYDTm3PA3DoZDuaNSTSbQQA2U6/bNr7cS9UfT2
         p7IF9/g5kYPv+7zu0Hna0cKreenEHO3tXd8zckU+dgyXH0irk3h16PnDarWmVQUNxenU
         y5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782258104; x=1782862904;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5R4jJVdiiD97J3GTz0Op+QXJSLTSXOE5UM4tQq8YjrM=;
        b=UpkxU3zVTbRCbTcCMsjVNCUitIj5Fwegk1NAM5pYdeJdNjgDTGtrhFMDM12SMjWx5Q
         yazU/wVab1iTx13/IgL4Iqhdg/OzOTSDRzUmQI+ta/Wb3XTUp4f8yI1esHIEIbFpYuh5
         pFqvgXf96hQYg/JXkmqtSQ/EEZIrGiI/fwkLJGZywfQ4FpnmYeP70++974Yv8fp/34YR
         PP5jWF/TE4/mendO+nKJzh5QulhvzSCBvrP3mjIALISXGL7w8UxynCLCQXCZYF19ZkeD
         SOLDMZvt+BFmBpBFaklkCddD9D/OLCktm6T6sr6S+2enpIpi15KoXdqDjPFcX/5SpJeK
         uJ7A==
X-Gm-Message-State: AOJu0YztbkII5T5Wn7+IxUH8qi8elsj8m9XIZv4KpIHpn7YUjAQQJLMd
	CuS4wnzXtwj+lQAkucS6FkxXjPsJ0tWBPY8TXNFl6zmNOSTRHNCNmY1Jk6FpbqbeGaDp1ptN0Cc
	q6OGpHeIHiVKHusrUjoBR0hLGHi/SN8m8UABLkAkY
X-Gm-Gg: AfdE7clBF6IvZ0hnATC3yFd6iLv/SOjZ8/YZ/hKeXqVrGHDopNjZOmLzyN1xpdupinj
	r0vyG51PSjnjaib0rMjKfUlO6yXhtIZA1+N0ZRGlUATd/li8Okh2BOLLiIOf6uZpzbdb2ow6F4R
	ETWKX7LTHyEEcrTE1m3xvldWFoQREyU5Jc8vQMIqttRmM1yZGIxd+ZhTI8MtbifnJwKYmKjnm/o
	df9eQhwJKttZ9d33hL7Rn5rrnAjbBmW1mBzCNatOuMQVfLIKJxNmu3Khk/+fSns2Ui2M1PiSxkp
	kHJvFQE+rBsYvx4pKL+K2ZGhloVZa/gqNjzgcbZE8qX2Gzj0tWaEHGec66o=
X-Received: by 2002:a05:7300:4314:b0:30c:41df:3734 with SMTP id
 5a478bee46e88-30c58c1760dmr5223426eec.22.1782258103394; Tue, 23 Jun 2026
 16:41:43 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 16:41:42 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 16:41:42 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <ajMPvgA2eHQCj-B0@google.com>
References: <20260615155244.183044-1-alexandru.elisei@arm.com>
 <20260615160901.9A1A61F000E9@smtp.kernel.org> <ajA6ogaNiI3KDv5i@google.com>
 <ajKcDRqT5m069PXK@raptor> <ajMPvgA2eHQCj-B0@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Tue, 23 Jun 2026 16:41:42 -0700
X-Gm-Features: AVVi8Ce0E01zo3uw2YUeY9tYq73kkPJeDmWeesJXGCOlSxxJ-xDfRo5Fdwxu5EY
Message-ID: <CAEvNRgE9cLfjDbXuR5wq3fEWZyHxYPxdExxNjXUFO1nT5m==1A@mail.gmail.com>
Subject: Re: [RFC PATCH] KVM: Ignore MMU notifiers for guest_memfd-only memslots
To: Sean Christopherson <seanjc@google.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Cc: sashiko-reviews@lists.linux.dev, Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, Oliver Upton <oupton@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Sean Christopherson <seanjc@google.com> writes:

>
> [...snip...]
>
>>
>> The KVM_MEMSLOT_GMEM_ONLY flag is set if the backing guest_memfd has been
>> created with GUEST_MEMFD_FLAG_MMAP. The documentation for the flag says
>> that '[..] the fault will always be consumed from guest_memfd, regardless
>> of whether it is a shared or private fault'.  As far as I can tell, this
>> means that, absent a fallocate(FALLOC_FL_PUNCH_HOLE) call, the page is
>> still in the page cache for the guest_memfd file after userspace has
>> unmapped it, so the guest will not be accessing a freed page.
>
> KVM_MEMSLOT_GMEM_ONLY is somewhat misleading, it only applies to the KVM's MMU.
> For other cases where KVM accesses guest memory, KVM still follows the host virtual
> address, e.g. so that copy_{to,from}_user() Just Works.  But userspace isn't
> strictly *required* to keep the userspace mapping coherent with guest_memfd, nor
> is userspace required to make the userspace mapping fully RWX.  And so if
> userspace modifies the VMA, KVM needs to react accordingly.
>
> When in-place conversion comes along, KVM will also rely on userspace mappings
> being torn down before allow a SHARED page to become PRIVATE (for all intents

Conversions explicitly unmaps the pages being converted from userspace
page tables, then checks for users other than guest_memfd. Unmapping
does invoke the MMU notifier stuff, but conversions doesn't rely on MMU
notifiers to unmap from stage 2 page tables, since conversions directly
calls kvm_gmem_invalidate_start().

On a shared to private conversion, if the page was mapped in stage 2
page tables, we'd have tried to unmap it twice (the second time doesn't
actually unmap, but still tells guest vCPUs trying to fault to retry.

So we're good! With this, the first unmap will notify through MMU
notifiers but actually do no unmapping. Thank you for working on this!

> and purposes, we're conceptually treating conversions as free()+re-alloc().  So
> while the page might still be in the page cache, it's effectively been "freed".
> So in that case, KVM really does need to ensure it handles mmu_notifier events
> correctly to avoid UAF.

Just making sure: "handle mmu_notifier events" here refers to
gfn_to_pfn_cache and other parts of KVM that works with memory. There's
no issue with a UAF between mmu_notifier invalidations and conversions,
right?
