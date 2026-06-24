Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A41322B8C
	for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 16:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782317684; cv=pass; b=u676JGIUVDZVHVB9C4zkrYOFRyzvv5ib/J+MdaQvff0CbXjI5kw+tR3zkHG+vIDGsdWbnNUd/HwxCfhlDBTxrIGgmrZ/5FEYqcbKSMzb4TX3S6KWCp0rlqncl6yEhAuCBbKzp3H4+AvlzZo6a0uXYVP9Wm5kbNHY00xHCOSmiJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782317684; c=relaxed/simple;
	bh=Sdzgqtv1Tmlni/DBclt3F/1Zy3gjhyQWqH2lmWCayf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QbwpUNdeyLTv9Cwe6uHigoZisNa1YH7NAOJP0VzszSnaPHjYj0/gLuhTsxtar8gZgYdkzOETglmfihnV3IGbUmNQ0zZOE7J5pOm8Yz6yzYyL6oiZWIeolbj4zxznLgD0cUh1Xlrb45HpRqDqMO0bo3svro8nVF+JZYoS+7NO8l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N0a+C77s; arc=pass smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N0a+C77s"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51765331535so296811cf.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 24 Jun 2026 09:14:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782317682; cv=none;
        d=google.com; s=arc-20260327;
        b=ovUbgh1ZmD27J2Nkt0earDv5rpIdarHqY0EiBTM+rA4VHpxvYBv6aH6qUN9PcLIbDU
         njKU0bwr4dGC+uq3Zs8piObHh61h7X3OyNXCO7/5GUrgeWCr0pFssHBwmAQQvewwU7Rm
         /cHLTs73I3XFNio0DmgCvtYY499gPg8ihxn6OpO6Mekpmt8D4Sa3ARlx2MbCxKegs/KP
         +fDoCN5SgnoQ6fAmgWaOY+Azr49kjYKUogEG7WPnYZe+xd+iWqUwhDvptwBzbtOm6LqF
         mR4mhAcCh0k/GvNBaCVprPOYD6btp50YFOLSre3K28nZUUD55X+dgkssXPUXowvDA8il
         Sddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L4jqqFTyVaEfw5oQOEDvCjggk+pjLmWqgC46xkeFBNE=;
        fh=FveIH4/heLdjykJqUFaun0Ya0q5T+IXfEN37pnA+52Y=;
        b=kbUyneDsuYisrcYggMFODPFtXvHK4/avoYOnj60OZOBUdg4JUlkELh32sNvWCEpyLS
         nqkh8PgLcyEirmSCCMOnolABWLXPMdUq+XKDMUTPHQRcNgrN8FKfgBQPnB8J0C0xgIn4
         8TBjcTP+1/0YGNJxZ+nka7hKoeMuLEkLSp/QN7X53761spsozYJxcuCAG4KXaFjjy0St
         xWVZ1wXYyxWcct+HoPz1kxYVg8hi01g94/jX1jc8FxCPI8saMYcUpEejEVIO1bpu6uxG
         xYGS7fnOkxqCCiCcB/8OU9kBSBNjhobx/YiF+SXKVtXKvY6wD41bMwjo4027ffpWn5r5
         PEog==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782317682; x=1782922482; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4jqqFTyVaEfw5oQOEDvCjggk+pjLmWqgC46xkeFBNE=;
        b=N0a+C77s4PYXgC/RuSsGwKG7dxp5BB7zB2jzx2oQV+dTjCNU7sI8+u+r3RuTzSs/vu
         u+NyGQr8/f1aNRi2dvRlfFl4HERRJwBDaJ+BfuaqyCjyILXxjKBdXmsMCx6jfb63IHju
         7rCVAEujhwRiz6/eGrWRS0Jjd0mktbQqRnnszIrpBeaU0DtodgCw5/y60DFtzs93DVmh
         l0+N8rhdCtXWVDWTV/PVMLaGOui5BFwYA635tf7sfCW4GywPDMmnr+vWeMUwAroipKu6
         rKjGwaBbifnA8NhmO5qCzYaA989CUC74v95D7MCdNmzKGYsKRQoK55bCvOM3iQd/KxDZ
         nJlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782317682; x=1782922482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4jqqFTyVaEfw5oQOEDvCjggk+pjLmWqgC46xkeFBNE=;
        b=NQVHlLFys6yX+YNP58+acdOw15qVPOzzx2xUWDRHAgbUtRzVUfimC6zNFgJqj4KkvH
         sk9yr+YFhIffuPKDAva0R0qZtw+en60kB9qwBQpbkfnWk40AW5dEHQXsbItJtgYE9cmq
         FoIOWqmvOSbi+K9S3M6o8s1BHXGzwJ1uLSW85VhoiLOtapWRZVNxpTBjbz8I0sqprYVd
         /oRJvCPqGdyrNnTYTl1NlRv6BLMpOVeq5rjApRVLEmcvnUOMkQf6+49sf6gETUfIrtjb
         UmeBHpXyggsn4Qi3JDQ6PSaGeB56ijVvd9NFOQRehs6eXqTwgy0pgjqhf/25XN64kvDl
         Rv0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8Wf3NIJwPK2wd2ttod/4CnZ312ex4WMTDELn7/zSJmYiZVSh/ALxEXQyhnHgDO7XApp3XJjB4l6di4k7YqxU0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlKNymKmRbPH7X49B+jLrHPOHdmxZHy/mc9OFV9eIfwZ1vmZxv
	DaAzk1oXVS0zw5BGPGL2xPc9pSIqhKz8fh4Ter7C+wx5WcSIqO9GWeXSDLUK05dQn8ZQHoy0Q9z
	IxVzB5KSIgWKk8G2/He/q9rUZmRhddb5b71KFo3rd
X-Gm-Gg: AfdE7cly1BksYuMx5dD943p4vmh07uGOa4ctG4gXycv148UhroON9prv8AmX/+ZZnQj
	vW2y1ATyfErIROIGhYCWuP7NDHYZ8gVFDTxSFmSewZVI4IgeyQ9IQXMJ8Q6WiOVwJxDBJEt/6FL
	nlVrzRCM/yItlOcKZki8jvIrNN8xrLPViVoJG1mPS4R60kJPCtO/rALxiJjOCahi3p16bBkHiIq
	CWi2LRoNLaOBFWnrQRpfx35tEeK00crpJkDncJHLG435Nrb88T8yKzv8usPEgjSg+iTUzEh9+1E
	USbrQQps5RFn9Odm7rXg+THAu0w=
X-Received: by 2002:a05:622a:14:b0:519:df4f:6c93 with SMTP id
 d75a77b69052e-51a617dba42mr10324841cf.20.1782317681383; Wed, 24 Jun 2026
 09:14:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260622-alloc-trylock-v2-0-31f31367d420@google.com>
 <20260622-alloc-trylock-v2-6-31f31367d420@google.com> <20260622101056.4120C1F000E9@smtp.kernel.org>
 <DJFI4P57YE9X.20DPMTK9LL7LW@linux.dev> <ajm_dEqauYLBi-7T@google.com> <ajnTJ03IxVnBXWdp@google.com>
In-Reply-To: <ajnTJ03IxVnBXWdp@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 24 Jun 2026 09:14:30 -0700
X-Gm-Features: AVVi8CfUZG4ru4sHeWtIPbsYQyBEOrJbLz3f3SZdi_mmHQdVijFR8buxYw7ygJ4
Message-ID: <CAJuCfpEUZ-xL7ebW21Q=5wXDFuJSeh52Ei-8YLsRUdXiB5NiYg@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] KVM: VMX: Use higher-level allocator
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	sashiko-reviews@lists.linux.dev, Brendan Jackman <jackmanb@google.com>, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 5:29=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Mon, Jun 22, 2026 at 04:04:20PM -0700, Sean Christopherson wrote:
> > On Mon, Jun 22, 2026, Brendan Jackman wrote:
> > > On Mon Jun 22, 2026 at 10:10 AM UTC, sashiko-bot wrote:
> > > > Thank you for your contribution! Sashiko AI review found 1 potentia=
l issue(s) to consider:
> > > > - [Medium] The commit message incorrectly states that `__alloc_page=
s_node()` allows passing `NUMA_NO_NODE`, while the opposite is true.
> > > > --
> > > >
> > > > commit 7bd439c242125db27305b61b14c9972fb028282a
> > > > Author: Brendan Jackman <jackmanb@google.com>
> > > >
> > > > KVM: VMX: Use higher-level allocator
> >
> > While you're dealing with nits, can you massage the shortlog to somethi=
ng like:
> >
> >   KVM: VMX: Use no-underscores API when allocating pages for a specific=
 NUMA node
> >
> > "Use higher-level allocator" is extremely vague, and arguably misleadin=
g because
> > the "allocator" being used isn't changing.  Which is kinda the point: *=
nothing*
> > is changing in practice.
>
> Maybe "higher-level allocator API"?
>
> no-underscores is just.. meh :P

It's overall a good idea to add "No functional change intended" at the
end of the changelog in all these cleanup patches.

>
