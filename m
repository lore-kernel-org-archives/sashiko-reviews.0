Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5817146C4B9
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 16:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649775; cv=none; b=emlGzXRioTTF5dDYs6jwFk55nBlC5PpayjrlelkxqwQmjo1vCrQxaTDi3OvBq7VRJh4I5mAmSorZSAWxToY3DLHbnB3y1C89oPiov0xnSBCOcuD9vaHAFKMoccBqA2C5BDMtQ3EPl9dLgIOUskQkw8Ojt2i4M0A8Y+xbjvuanHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649775; c=relaxed/simple;
	bh=feRZ4QKSvrkCWAWS59c5Jn+FQo1zqyY8SL/+SCIGU2k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCpYe9o2GbISqocsydNYuaKQInfssX5dMoLDMoE5PKooXrbROgm5bJJzlUlHDcHx9LetRb/iR0hv0w8i+UiNNUsfFpKAW0BLUGnSxRfLya/OL8CxZsoSiz2AJHgsqj1cqHCB358Ffiq3lXhSYK9rc2RcgAyFR5imzSTE4OPamrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MBQ7t2/3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MBQ7t2/3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784649773;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=STnbg2Xg1zNCMraSp4HmfOF93WxrXN106QbVgR4DyVw=;
	b=MBQ7t2/3Nga2EJESsKasuwk9jS7nCOqPkMLBZi7JQVeQ7Aw62GuinyQJJoA6moWbJQn7i3
	/b4l0iAIrHmkLBa+LtEaH8cm7XCRC51uFgJSpyF9cDC3VMjyy/k5T5WjyyIJcNKiEtVu0s
	81Uj/g0tPePh7brXJPVsMLBvjKSzc7c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-6c0XQ_leNr6IHYz5nfvUuQ-1; Tue, 21 Jul 2026 12:02:49 -0400
X-MC-Unique: 6c0XQ_leNr6IHYz5nfvUuQ-1
X-Mimecast-MFC-AGG-ID: 6c0XQ_leNr6IHYz5nfvUuQ_1784649769
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49544a639e9so30301995e9.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 09:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784649769; x=1785254569;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STnbg2Xg1zNCMraSp4HmfOF93WxrXN106QbVgR4DyVw=;
        b=qTzTJq6KbqoOmJ4ytLiT+0AbMpmMvK6ivvnGxv49qkJijJ8WF9k86i8Yqm+/smSByq
         Cez7ECnqk+McDLc/Xwa0kLo+CEFP0wKC5ocgnwzaOCzE5V0Urtt8x6J427W9KHiXkeZp
         wuQS7EsZkmhkqHdKQygEP6XNIf/oCmh9JaHjbQK4GH/WTZfhqylqMTeD9JJ/59eh2b+N
         QWiY6Ms9cIR7P7NRMKf0SOT2ogP9/GWclrkeXR5HKpZth3WaTSH/SM4HDdiNefeaebwx
         ewgmxKE8JlYWCDtCyqj83PS/4goVQqH3jPvKFi3ItTrzUfWbOIwgH6wnBiuxNUEB/avu
         nLvw==
X-Gm-Message-State: AOJu0Yxz7m2l2oLtUSwzCjRRoO+EJ1JeJoH5ix3L9My7Ri5oIXVXvDhK
	079oumKMlrFj6Ad8NxY2+/tBxYslmY8e8HZfbO8GxRqLaeRVu4sNpPEnvUym59Rpva6VVbrNvhR
	6i5J0V91rnOKl2sctsqWJVCIlwihioxPK64kw//w4Csa6Yj1MftKEWO6f5qaE2B/AWCt26vf9g6
	RXxyVXZcRX0+FUFdSq+ah959ZSbmMjN9Gi1JnvRbMdQnUYPL+xlVJedlc=
X-Gm-Gg: AfdE7cl5jKHxdNtnYd11EJtFKyZjj6jCFRN0kYLK6QfEb8WB0bv8PrGH2CAkmE2nNyy
	cjdrNzvFLuTARxjKmperfmJvuOSfdcMNAcWxq4/kwDMVfCCtyhm53TbRrut9c1owvfzcSqilj1L
	oaZXa75c4iZ5xgEZGsCEPmcG0Iha0r158gpWICBUVOc2H3K3iS5q91U9+cZ6y4GAxjGFc/IiM6h
	DXgiysQ8rcKslgIZQSDJbE+LCDmRZW40/2F8b7QZ0YYsu6JWrr36rKoteg=
X-Received: by 2002:a05:600c:4f14:b0:495:69c8:d9ab with SMTP id 5b1f17b1804b1-49569c8d9d3mr10999655e9.8.1784649768459;
        Tue, 21 Jul 2026 09:02:48 -0700 (PDT)
X-Received: by 2002:a05:600c:4f14:b0:495:69c8:d9ab with SMTP id
 5b1f17b1804b1-49569c8d9d3mr10999245e9.8.1784649767985; Tue, 21 Jul 2026
 09:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721102827.313208-1-pbonzini@redhat.com> <20260721104819.B5A101F00A3E@smtp.kernel.org>
 <al-PSX0sOPdYdvIg@google.com>
In-Reply-To: <al-PSX0sOPdYdvIg@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 21 Jul 2026 18:02:35 +0200
X-Gm-Features: AUfX_mwiJzgrlxMZTOoAY1MJbpOdubq8Khyrmy2TCut5ao7x0eFSUWRMAnM8hb0
Message-ID: <CABgObfbL3t21yVeSwiLSjjOUER+rTYDPHYAH9YU4TWGRjx6XHg@mail.gmail.com>
Subject: Re: [PATCH] KVM: nVMX: Hide shadow VMCS right after VMCLEAR
To: Sean Christopherson <seanjc@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hkQaK7UtSsxBbI46ZlTiKEqsTUPmNuK1wMMEgDptPpQ_1784649769
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 5:25=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
> FWIW, I had a pretty strong preference for Paolo's off-list suggestion of
> explicitly disabling preemption, even before seeing Sashiko's response.  =
Every
> other path the VMCLEARs the shadow VMCS runs with preemption disabled, IM=
O it's
> more intuitive to follow suit here.  And even with the comment, it took a=
 good
> 5-10 minutes of staring to understand what exactly is going wrong, though=
 that's
> probably a me problem.

Well, it would be at least an us problem---but I thought I was in the
minority... The only (IMO bad) reason to leave preemption enabled is
to obscure the change, but that's a lost battle anyway these days so
why bother.

That said, I am surprised that VMCLEAR/VMREAD/VMWRITE/VMPTRLD do not
have a memory clobber, since they access internal processor registers
and the compiler may reorder them without the clobber. Fixing that
would also work around Sashiko's complaint, so I guess we should do it
anyway? And disabling preemption can be done separately on top of this
change, which is already on its way to Linus.

Paolo

