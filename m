Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B72BE655
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 16:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780330837; cv=none; b=g2Aog0YhFyPX6Zu8uwTrB66kDjY8ofQPTj5t6x+UelNgW1wFzb4g+oA9pSVR6/v41iH6JtXQfh4TLDv6zC1YNEMDL6srl8J5dhExz6X/AO8fNM2TI6sQtroTSVpQT1mfTimpdkgQXQ9WVkUn7h/xA4g4ylw+2QDYHBqYsWR/bpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780330837; c=relaxed/simple;
	bh=+6fDoFCLgMnhc6zDBiLDHez2SDYFtd6gXfTre2bo5bs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b4+0kaLfq8BaQk0QrQAfCo/oxMJ/0SFTok26o98F3Gkd/y4EfFrH4cIo/Y55i1LbNT9PsqSIYlibc1evg2rCU7IbBGcvO8qrQ5zjc+IsiAWot7ynE9ceKo0vzxGy2vKzCrDpoNqLjYP8ILmA/BEdjP9kn7pG6NjVzc7ThWoNNMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OJIcJ/Js; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OJIcJ/Js"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2bf32fb7cb2so19450545ad.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 09:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780330834; x=1780935634; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hj0JbjSpVQ8PMU19bEVL9jVWMkxuYStreByX7gzfW/k=;
        b=OJIcJ/JsoK/rvY+NOcPE3OraMjbcridtteNfUdb72oIGz+NDi7JG24CpreLno6oApb
         bIJ3ZPYd9klFBQT+0asfMjHIARhfMem0YG90TT+fPmWfQ8DDZqU/LRVCn4LRazVR0Hfi
         27TSj2E6Nb4yPbhs/0A9BkOrq1PqlmBfuS7l3RsbInNnDIGYov6U82euHg8O1L7DOD1e
         ORV82NxcKp5LKxc+2q11fqEkNuAb3GNhG5hOx/pWRLO3I82RLkVWWDkEK7KDlBOwpKP/
         WgAos8/ZOeSfRRa7p/+nQ0TD2hwcqpACSTi0swBWUw+TEY+yGtWSSEICCM4+uX8pjiJl
         Z9pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780330834; x=1780935634;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hj0JbjSpVQ8PMU19bEVL9jVWMkxuYStreByX7gzfW/k=;
        b=acESYBRMVAExSz6zW1cdAVrtCbX0oiuIdzbHdcCr3Q9bBlyoVjltzR6/mqDFB1RtjV
         g5pc2dKQBF7g4i0fUqR2ApqBfGDMjyG7ERoSQ5PB3rywG6YX4MkbLw97zrc3bzLXXZPp
         u5ZRdDW6z02f1cL+vTrXF2f0QW3Znzgcf6Deh0MErbNDPEobGXYS8qmYkpU4gASz5wq/
         YJREHb+8Nhu5Y4iOZVaq+jDTPE0W73zVsTElrmwBSDDqjkiz6wwczRwgo537jmfDFyS8
         AgQjJnBp3OsqyQBjfgRT2Rn0VIXKIFTtjI7e8KFQ0UHNgfTLbpBxfk4xB8wElktC1qef
         8XPA==
X-Gm-Message-State: AOJu0Yw1RognmxC69qAA9iLT/w4cvpmwbc/lbWJWM3vGCOdICXC8FMha
	1Q0hq66UEBGHd8RmHTOXDf7kE4maV98peNNKaEFT0Qs7b5Pc+DJ2MIn06R21jJMoOOrlxiYCzWV
	p3Cae/inDfwwvh4aEKWxNoyVAaiFsACK60JvoVAFYKBx2YPXlbCYBiW4l68QxvKRe+X1RM0PRyS
	wXWsZHECa6zQLEh9xyDiMebPffPE0xXAyHkdYCRXVqhFKmWiKd
X-Received: from plth11.prod.google.com ([2002:a17:902:704b:b0:2b6:417:db8d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d4ce:b0:2bd:606d:b339
 with SMTP id d9443c01a7336-2bf3682c1afmr144415775ad.21.1780330833751; Mon, 01
 Jun 2026 09:20:33 -0700 (PDT)
Date: Mon, 1 Jun 2026 09:20:33 -0700
In-Reply-To: <20260529232114.F1D7A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260529183549.1104619-12-pbonzini@redhat.com> <20260529232114.F1D7A1F00893@smtp.kernel.org>
Message-ID: <ah2xUUtva9bYaYyG@google.com>
Subject: Re: [PATCH 11/24] KVM: SEV: Make it more obvious when KVM is writing
 back the current PSC index
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, May 29, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
> > --- a/arch/x86/kvm/svm/sev.c
> > +++ b/arch/x86/kvm/svm/sev.c
> > @@ -3947,7 +3947,7 @@ static int snp_begin_psc(struct vcpu_svm *svm)
> >  	}
> >  
> >  	/* Find the start of the next range which needs processing. */
> > -	for (idx = idx_start; idx <= idx_end; idx++, hdr->cur_entry++) {
> > +	for (idx = idx_start; idx <= idx_end; idx++) {
> >  		entry_start = READ_ONCE(entries[idx]);
> >  
> [ ... ]
> > @@ -3974,6 +3974,14 @@ static int snp_begin_psc(struct vcpu_svm *svm)
> >  
> >  		if (npages)
> >  			break;
> > +
> > +		/*
> > +		 * Increment the guest-visible index to communicate the current
> > +		 * entry back to the guest, e.g. in case of failure.  No need
> > +		 * for READ_ONCE() as KVM doesn't consume the field, i.e. a
> > +		 * misbehaving guest can only break itself.
> > +		 */
> > +		hdr->cur_entry++;
> >  	}
> >  
> >  	if (idx > idx_end) {
> 
> [Severity: High]
> This is a pre-existing issue, but since we're examining how a misbehaving 
> guest affects the PSC processing loop, is it possible for a guest to trigger 
> a soft lockup here?
> 
> Looking at snp_begin_psc(), if the guest submits an unsupported PSC operation,
> we hit the default case and loop back:
> 
> next_range:
>     idx_start = READ_ONCE(hdr->cur_entry);
>     ...
>     switch (entry_start.operation) {
>     ...
>     default:
>         __snp_complete_one_psc(svm);
>         goto next_range;
>     }
> 
> If a malicious guest concurrently resets hdr->cur_entry back to 0 in the
> GHCB shared memory, could the host get trapped continuously reading an
> index of 0 and re-processing the same unsupported entry? 

Already fixed in patch 16, "KVM: SEV: Read start/end indices of PSC requests
exactly once per #VMGEXIT".
