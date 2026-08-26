Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E2E3C76A2
	for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 18:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769586; cv=none; b=RxRM0pa/csEivHbA5oPhfKHKIboi7WiNphrz62kal2I1A6qi931K+BkuCbbrTBxmFJlsYlQbafVzAGwjB13Rd2F9MvKa0uzwRuZx3aHl1b1Dfn1VYhBiT67+LcwGgS1b17XmN7j3uyy9rgQwbgmtTSXHnGHQdzVsx62JOaxXEcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769586; c=relaxed/simple;
	bh=X4dCGd6bkEA2cJ06CQNeFxBd0mqF1n9gi4l2ifHtpuc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XbWhc38k2gv5hBpWwUIiMUTCv1fgNmVYD0Tum/4hFOe51vCjpSR+86Dx+P6JlFBcFCyvGCECu1h1tNu8+OHF9JQKkVxT4RVneAFtThngh9FAL6A/Sbi+qLhdQyx1ZnX7n+Id0Bz7bIrwtHdpWo7EXeWrboknzWVNvxtBgaAWf2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qeSLysCt; arc=none smtp.client-ip=209.85.214.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qeSLysCt"
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso12347935ad.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 26 Aug 2026 11:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787769578; x=1788374378; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svW7REwf0C0yKBjSVBykLwlE0W36sIYmzgsGuY78Nos=;
        b=qeSLysCt8edruCs3TJH+mIOXsCo1yaabf2N6ZlTA6xT9ulTEK85BUzeLGvPN8VeixG
         5KSwvrg3sKTt0sF6otflUYYvctp/PX/PH1NbiqV0Q0aBJwt0fYbJ47+ajtsS5ZOxUjh7
         mnF/Ku01TiOCb7++UKScTL6gfdICoE2EVzDyhG5taEjzD2t7V/xX7o04z5uPF9ov46UI
         8z9jZN3NtYV+bSXSLZRVTA/mVOinKYnsDZ/6MWqoW05afC58X/T38JVnNd8ar31SkpDV
         CDKnHwsAR6kikPQEWInu/9p+hD2Z7L73l1U0H2qVxIo+T21eooVXBCgDru5mpJcOJWwZ
         g4oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787769578; x=1788374378;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=svW7REwf0C0yKBjSVBykLwlE0W36sIYmzgsGuY78Nos=;
        b=TVVtmGkoIXTMuhv4TzjbmxVk7TjX0x72DUmJr2uePz5iYI5YZeSCEClfTB9vjAMNtp
         6u7DaUpPH0d+ilcTXI4Nrq5K8QJB3jzf7wMARs8z4tevRrZvPWXl9+b7n9NKlHqaQzxx
         Rq7K8sWKUftJ510H8sr5sBZTwcaaoJ0EqSAdT4mvvRx9VrKsydoxEGD0Fny9JxfgIO+r
         f4x26dJ5H/LZNevCzC2df3LxEMHjLmE3C9oLlMrbX9eMTwKqZykxlD60vmRjURRNagSZ
         VZzr3YxlWSoEB/E7diE+5Gzubn+b0Pp23WhS2WP220cgLPoF8stqAjcQKhqRaCvcBQ3D
         B/0Q==
X-Gm-Message-State: AFuF++nv7kXFonVsw3LrCxX4t9itkaPW5cm8V/IyiOu6m5oS1pZFSv3a
	1OhpYcCkpjKFa1OafXyTPkSJargTB173ney5uqFRtPsHSQS1mEzrg9NQ5gFT5UdEn6q8cs0rU6h
	iEtb8tpL2NUOrwt25yWvHb8tSKgjnbJL351mQISbuZ8KX727Zd+RX2kkWQVo2RSA5SUcvY+J4wj
	28ETlLCxQ4ka1scgC5lcntniotdQrBRxfJK+/Xv3EN1kbCSxY8
X-Received: from plbks11.prod.google.com ([2002:a17:903:84b:b0:2cb:3f5b:b116])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2392:b0:2d0:cc92:f7a3
 with SMTP id d9443c01a7336-2d707a53a0fmr177647795ad.2.1787769577699; Wed, 26
 Aug 2026 11:39:37 -0700 (PDT)
Date: Wed, 26 Aug 2026 11:39:37 -0700
In-Reply-To: <20260826171151.959AC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260826165647.769231-1-seanjc@google.com> <20260826171151.959AC1F000E9@smtp.kernel.org>
Message-ID: <ao8y6d5gMN1wG_C0@google.com>
Subject: Re: [PATCH v2] KVM: guest_memfd: Elaborate on how release() vs.
 get_pfn() is safe against UAF
From: Sean Christopherson <seanjc@google.com>
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Aug 26, 2026, sashiko-bot@kernel.org wrote:
> > diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> > index b596486d184ca..7f1c6a0f8039d 100644
> > --- a/virt/kvm/guest_memfd.c
> > +++ b/virt/kvm/guest_memfd.c
> [ ... ]
> > @@ -300,17 +300,55 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
> >  	 * dereferencing the slot for existing bindings needs to be protected
> >  	 * against memslot updates, specifically so that unbind doesn't race
> >  	 * and free the memslot (kvm_gmem_get_file() will return NULL).
> >  	 */
> >  	mutex_lock(&kvm->slots_lock);
> >  
> >  	filemap_invalidate_lock(inode->i_mapping);
> >  
> > +	/*
> > +	 * Note!  synchronize_srcu() is _not_ needed after nullifying memslot
> [ ... ]
> > +	 * Obviously KVM would be broken in many places if the synchronization
> > +	 * were omitted, but it's important to note that get_file_active() does
> > +	 * NOT guarantee a reference to the correct file was obtained, only
> > +	 * that the file doesn't point at a reallocated object.
> > +	 */
> >  	xa_for_each(&f->bindings, index, slot)
> >  		WRITE_ONCE(slot->gmem.file, NULL);
> >  
> 
> [Severity: Critical]
> This is a pre-existing issue, but could bypassing filemap_invalidate_lock in
> kvm_gmem_unbind() when the file is dying allow concurrent xarray modifications
> that result in a use-after-free?

Yep, already reported by Sashiko and being fixed:
https://lore.kernel.org/all/20260823-shivank-gmem-fix-split-v1-1-512a29fb8e86@amd.com
