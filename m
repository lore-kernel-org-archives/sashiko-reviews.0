Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D03735B650
	for <sashiko-reviews@lists.linux.dev>; Thu,  4 Jun 2026 17:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780594920; cv=none; b=A0z7j6/MYlJbKlnDhvm5z2vcNitJfsu/WTY1eqzo11rfy76mFXIC8t/TUxWUM+Ku66YOZmRSfqjEPLbAeuxigXHwjJ1XqhR60faNsUSDaWakUY1WUXeO3b2PbTraIVjKlAg+gNW6XvQQ1fXqaIhcyFxhAsEhL3eQY3ZWq5RvJzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780594920; c=relaxed/simple;
	bh=ezSlhog56VUDGe4X2nOnkDwxK++qGblH63of9Uv59cI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZeYIxKGTLi6Iav/sqTZhfO3KpISPCRm6vfyaJVmanIm2lpiB9h1orgeHcIKy5Iti9rWUW7e2jJrj8Lf3XSP5NMP2ZYsxwKW4xUd2AUolF/7wBuFvbvvY80c+y8tgkng9H1IavevZ3p2BU56u7YpIXZJwVuQkDYpRSNlb3GS9hgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hLpdEQtq; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hLpdEQtq"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-8428384f31fso736882b3a.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 04 Jun 2026 10:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780594918; x=1781199718; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VWduaCqIW5OJ/1rUkmACp7uJQm5U7cfJMYHZpLa1/5M=;
        b=hLpdEQtqW835ZtNJgRkCQNZmJ4hMlDY0xbQhNtAXpdNgDK1F1yxFde+CwENqNWxSRU
         etKZ6nsZIuNiZEh3qJKRR44Xanm6r0GdaI5D4Izn+OMu2uYLfRjWYdfXpzWh2V/4E2s8
         KTu/BdIawky4ZA7B6KEf3PFJ2CfalETz02kWhkGci4Ddg+yOKwfhpP6yoPitcmIElz5S
         XTjzeASEj8Cvd7p6cQklPBivnk3bdu2tF+xgjKSr0mF8Rt8tInuvhcARcz9TxpfX+m0b
         Tdma+3lnAu7o2SzpJheYAKFFzw9OjBwcbG18iKplZhdDybcgqOjoOPLqBf8fpjQBNFkx
         XFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780594918; x=1781199718;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWduaCqIW5OJ/1rUkmACp7uJQm5U7cfJMYHZpLa1/5M=;
        b=LVlAPrYAdgega1ZPi1n3MKv1pA8+OyxAgiids0NIxlnicCyrD6/P7hfI98vX6w+5m5
         nCb6kizI+7cCXg5sqN2IX+YZqjtBvQmAKu763gOK8CwzLIpKUKJz8ibtmGtgQhhTWRwi
         jHlFtACc444SbJCbsoc8kVwPB+vpFAfOuEZyhuHGNNx08DzrD6Qz7c9XUOA00nrAn2J8
         PFGEzfwhYm6ExPHZlAeJOs70cD4+gFcwYKL1WzzxUrSeqbag9WCjUwezf85kN5HLRWw4
         phnHPAPHh5h+r2SwHPs9UyMc5gv1QvENOh2T9KVXjOLTHrnlKf+UaCb2bNt+pT2KGNjq
         Dp8Q==
X-Gm-Message-State: AOJu0YytMPHlHQM+9g/ypiOucoeIMmM+Qkywr0rBBSPxCXXqp0vl7pbP
	GkMUF3mglrO6E5DUryo7kJdhytr3qzZJ4Pml22nex5d1MllFZgDm1v7dtEQlu6Nzz/UuPELlgQS
	/t+sxW34iI3RcfEuYdRsjmno/ziAtsBqcgpmXFAabv/xpAgNMalvGrTcfJQRRW3pKuUxTTzmtRT
	c0GsJJ/4o678/0sguMxfx4CcxBwFQ+qFFWz+sfxBcOhilxYbef
X-Received: from pful13.prod.google.com ([2002:a05:6a00:140d:b0:842:9ad4:d8c7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:188b:b0:83a:b344:826a
 with SMTP id d2e1a72fcca58-84284f78f93mr9224683b3a.26.1780594918108; Thu, 04
 Jun 2026 10:41:58 -0700 (PDT)
Date: Thu, 4 Jun 2026 10:41:57 -0700
In-Reply-To: <aiG13utvmTJeHbnV@google.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260604020143.748245-21-jrhilke@google.com> <20260604022049.A44EB1F00893@smtp.kernel.org>
 <aiG13utvmTJeHbnV@google.com>
Message-ID: <aiG45cqd0gCRVgp_@google.com>
Subject: Re: [PATCH v5 20/21] KVM: selftests: Make number of vCPUs
 configurable in IRQ test
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: Josh Hilke <jrhilke@google.com>, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 04, 2026, Sean Christopherson wrote:
> On Thu, Jun 04, 2026, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] Missing bounds check on user-supplied `nr_vcpus` allows stack buffer overflows and out-of-bounds global array accesses.
> > --
> > 
> > commit 115e22303a8d11509c805d6bfdcdbd39b670c16d
> > Author: David Matlack <dmatlack@google.com>
> > 
> > KVM: selftests: Make number of vCPUs configurable in IRQ test
> > 
> > This commit adds a '-v' flag to tools/testing/selftests/kvm/irq_test.c,
> > allowing users to configure the number of vCPUs to run in the test.
> > 
> > > diff --git a/tools/testing/selftests/kvm/irq_test.c b/tools/testing/selftests/kvm/irq_test.c
> > > index 1d66293b6d0b8..41c50caa928e2 100644
> > > --- a/tools/testing/selftests/kvm/irq_test.c
> > > +++ b/tools/testing/selftests/kvm/irq_test.c
> > [ ... ]
> > > @@ -213,6 +214,9 @@ int main(int argc, char **argv)
> > >  		case 'n':
> > >  			use_nmi = true;
> > >  			break;
> > > +		case 'v':
> > > +			nr_vcpus = atoi_positive("Number of vCPUS", optarg);
> > 
> > [Severity: Medium]
> > Does this code need a bounds check for nr_vcpus against KVM_MAX_VCPUS?
> 
> Yep.  It also needs to configure the test to enable x2APIC format and disable
> KVM's broadcast quirk, otherwise running with 255+ vCPUs will fail due to KVM
> blasting an IRQ to all vCPUs when trying to target vCPU 255.

Oh, and the routing logic needs to be updated to actually shove ID[31:8] into the
correct field.
