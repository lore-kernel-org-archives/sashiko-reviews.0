Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F3E423786
	for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 17:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785172688; cv=none; b=MWatbh6joQFM45SDD0qrub+s+BvAor5Zoz6pA52YXh3nI09mjF6FcxlSWdoElTSEE0yio/5lvmorJuaotZ1v10dVggnQU1fnG3p49s2VKeMnQ2OBEXblyt4eYGmkxSq4Nj21w1uPAZ+zr1mQl0NfhB5y39Jd+APASSyNqjbSlZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785172688; c=relaxed/simple;
	bh=PBKqzAIFe7VW+MbDxEswf+p4i4CabH73TufwBtnq3bY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHPwo97AcSFCIWy0XY37NIIBkD54B9QNwbhOW6Xzq8E5Jz8HI2Imh2fi2ojltSG6fiAbGex9/D3l5H/3JZDJNmIqR5jzWyNKtoFojeWWeFpqg+2/mz3KTPuj9+MGQi87Q0Tw/+Hf/0XMhDbnJOndOd1mlvzSCzzt8PUoxFaPPNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=crY5eqmI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="crY5eqmI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785172684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2bAK68h4nkkU7+V84vbNIvTXBljlLhntKwEho1xcqzE=;
	b=crY5eqmIKNArVobgVj6cCUZg76aYa4Y4IW9UevN+xsqVKygtzr27/I+pibEQPb4DRw6o6E
	erZYULeKL4JR+OhtF2GG3tUwP9W8V1MEpq44zvP/nUMcPBBnINxKBbpPtgbFMFUdhaSGsJ
	FVLGIMcgSE2ikQKx3EAGmwDmUfznGcs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-287-3ahdjDznN6yDy88XInlxxQ-1; Mon, 27 Jul 2026 13:18:02 -0400
X-MC-Unique: 3ahdjDznN6yDy88XInlxxQ-1
X-Mimecast-MFC-AGG-ID: 3ahdjDznN6yDy88XInlxxQ_1785172681
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c162ff98c4fso308016766b.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 27 Jul 2026 10:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785172681; x=1785777481;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2bAK68h4nkkU7+V84vbNIvTXBljlLhntKwEho1xcqzE=;
        b=AnEfgkcUQVWbY9uVmmMeHw8yFZCYdBXAoQL/klfdqbBzj5CCiaqZOTxd7etvPypipU
         8oooYWW0C75KU1k0lLFURNVrMQS37+8SE0YxZk9JGIn8IJj3fEVel9GqdP2Yo7OaBfgQ
         iJN1P1VDxEk+Mp/+ROrD3YN/9gAlk/p6bdQ/KqLzwzB5KT+uD6nTpapmcFJYsLmO3/8n
         yE42y8uAEKXexC0fUDHplEzXG90+xoz4RLrmDje9eqvBhMLsTax+lHrkVj9LK6+zgJB8
         AdUYR7iKglRzqaouzk/EPyzQdRyuElO1gz3BD+/2md58YnrlG9lSGXj1YxmiiX13bpvw
         RIZg==
X-Gm-Message-State: AOJu0Yw7j+k0vqKmzBnwcDOz4pVRScpozuLS42leahR6ls1z99rDBZSy
	3ZNbeDF9CVcHjcYK0DidMK+81l8aQfd5N2OP/vHXByChf+7MZYUiM9ddyTeWPimDc9UhfJAcdNk
	wjLuZ1p6e4j4PxXU/BCUPCKbPsruOj5OChNJ24RLdBL4hM0CZCTqyLjYTj3SvLvz6mNszNpg99I
	G7Ij1w8Cgvd/Z37BXPBq0r1Gl6oSKO0tR4Wqlaga2UUkoKWB8GgbgRnoc=
X-Gm-Gg: AR+sD12ABEvEpr3zuSjtuDqUDxjK2VpzZXOUia1i1uUvvMK64vma9WQMMgz5ac1RBNr
	GXhkBhqlqzl2w1GfZ6O0OTs/SwAF8+93KCnVIP/2p3vcMgq4OrnIsGtD0zviPx2eVpCYrsFGyEl
	/y/uDPm9kdCiLB1jVOBhK+vLBHf+fZBtB/8lZb/6b5Rlt7rNzHTxRJwzf4ZlBwgkkhzcFijZ0dN
	x7h6Ew3KOQX9uv0tqseo/o35O6jJ/Vye+H7ewWQ+6wkCo4=
X-Received: by 2002:a17:906:9f8a:b0:c19:5b6c:945 with SMTP id a640c23a62f3a-c1f69029e37mr1454066b.18.1785172681109;
        Mon, 27 Jul 2026 10:18:01 -0700 (PDT)
X-Received: by 2002:a17:906:9f8a:b0:c19:5b6c:945 with SMTP id
 a640c23a62f3a-c1f69029e37mr1452366b.18.1785172680689; Mon, 27 Jul 2026
 10:18:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724170132.3783816-1-murp@redhat.com> <20260724172024.0648C1F000E9@smtp.kernel.org>
In-Reply-To: <20260724172024.0648C1F000E9@smtp.kernel.org>
From: Paul Murphy <paumurph@redhat.com>
Date: Mon, 27 Jul 2026 12:17:49 -0500
X-Gm-Features: AUfX_mxTx87iMPGE3cmiwtbJGvMsOLS8t0lLku3EOBcAcWkpCyFidtWmbHobNdU
Message-ID: <CALYDSrQhUbKDHsPnQqp0K4WMe2iZC-G1nGrLT6eQ9doCqdVXKQ@mail.gmail.com>
Subject: Re: [PATCH] rust: enable fentry support
To: sashiko-reviews@lists.linux.dev
Cc: Paul Murphy <murp@redhat.com>, ojeda@kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T3VofF07iG4bGR6k5BCHscFAnDS00E87cuokaHoSA-Y_1785172681
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 24, 2026 at 12:26=E2=80=AFPM <sashiko-bot@kernel.org> wrote:

> > diff --git a/Makefile b/Makefile
> > index bfb47ad8cb9a7..bdfe93702a337 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1053,10 +1053,12 @@ ifdef CONFIG_HAVE_FENTRY
> >      CC_FLAGS_FTRACE  +=3D -mfentry
> >      CC_FLAGS_USING   +=3D -DCC_USING_FENTRY
> >    endif
> > +  RUSTFLAGS_FTRACE :=3D $(if $(call rustc-min-version,109800),-Zinstru=
ment-mcount=3Dfentry,)
>
> [Severity: High]
> Does this cause link errors or broken ftrace functionality on s390x?
>
> On s390x, the kernel does not use objtool for ftrace. Instead, the C comp=
iler
> uses -mnop-mcount and -mrecord-mcount to create the __mcount_loc section
> natively.
>
> Passing only -Zinstrument-mcount=3Dfentry to rustc without equivalent NOP=
 and
> section-recording instructions will cause LLVM to emit a standard call to
> __fentry__ or _mcount and fail to generate the __mcount_loc table.
>
> >  endif
> >  export CC_FLAGS_FTRACE
>

Hrm, s390x has more nuanced usage. It still uses -mrecord-mcount and
-mnop-mcount. The x86 configurations I've looked at use the kernel's
tooling to nop and record as needed. Is there any reason s390x cannot
use those, or should rustc support those (for s390x only)?

