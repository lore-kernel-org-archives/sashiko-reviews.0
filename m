Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C4C3242BC
	for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 16:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784651852; cv=none; b=Bx++PEfRf9yOXD5Xzn7JPIn+qyyhgZ7OESbFZGtfZdUzxB9nMGfoLJcNHWKZm7FMkGuSuOAVgCv1tpBCZIiYo8sC9W0aR0WeNTGp/7vrgjGktvw7Vk/PU1iT73ZKDYuDi3+IcAoTT5eJ5FlNw99kEFGyKzHwxQ4gZpVea2gs0VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784651852; c=relaxed/simple;
	bh=aVzR/ty4a/bVQF/s9l7ffmrbnU/SPOo7FIsD6OVmG+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z3gwwb69K4N1zJ/ha8HrTCSIQAcl6OeQ5236JK9cnFNNFteoKs21JM0+sY3lQiLo/lo1aPxf35SPDhfUBdNfOmOKUcQ++4vToeVm5yCUYTCJDlAyhd7hVGH/icYdQXhx/uYNKSBkm8709OV1+Uo5qPcPGvo18Hvm0k5INZIo2qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JMC9fkdF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JMC9fkdF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784651850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Iutbkgt++7YueaLk7npeqwZ+5objeIwiLgiciL5xn1c=;
	b=JMC9fkdFeKPB4jPdW1gYxqx9GzkINVzzAPvLn8DMK/oknVUfq7lIpuNw4Kei8vOWiTWpX7
	WbfWIHb1lQ/+CUMekrD5vT70m8HZdwqB2dM4lxX2VW5hB6yDCHpB8Miyk/R3KQJeGArabZ
	x+Q0WiWZvItULc0Pu6e7yIomHAnR4H4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-iBVfN_tfPCG6iFJuncPm-Q-1; Tue, 21 Jul 2026 12:37:29 -0400
X-MC-Unique: iBVfN_tfPCG6iFJuncPm-Q-1
X-Mimecast-MFC-AGG-ID: iBVfN_tfPCG6iFJuncPm-Q_1784651848
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4955ecd8a10so16659115e9.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 21 Jul 2026 09:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784651848; x=1785256648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iutbkgt++7YueaLk7npeqwZ+5objeIwiLgiciL5xn1c=;
        b=JWtzmEMqvH5OLYEbcphQS81sWHPfdDTuiin8ORJ7D+JeS2eh1NHRGx9q338OtwqY29
         PqLET6ssnqidWaY+vArcSGWujs/dN65EzcTALqGcJYQ+HoPb0//7n0Nz1cn9JSgHN326
         R1Mfc3VEEEXfSLgD1VyuCSysOqcF9GjiZpARNGnspYM5o20zUZkCqHvY9KlOF7VVu5R8
         KSVlNigDITrMLE2dzuRG+sIgapsm/8PBcs317+/m2EcECLDYoXnV3Cd4xDt0OB1CrWfH
         zuiXZhWjeJ6CvMk2JRDYRpIcR1Kd/30w50yLkQ9JOd+s2jkvy8ZH/yMyzHr6ZBuT8j8N
         cWqQ==
X-Gm-Message-State: AOJu0YzOiY/40pmbJE1iCg6MCfeR7+3GXrUds1A6Ht/UWqGYvYkru3A+
	abU69I3cJMs9lTJ0UMTxyewnA5zioML2j5/FZlrOk/M1HViMgOPgsWcYl3uVp0d4z/RrWzovFOa
	+SwlfqjqCtqGM3a4DEkBvVM7PuGiGL4m5uyA7vrTxyqRU5yUaY0FpiUf85yB0KzbeipxC7+0E5D
	q2x8Uzrcw/uSSiAjRolOX0hg3gQSJcw4OmNaEKxUurtmPN
X-Gm-Gg: AfdE7clUiRExOvkz+klLm6Neqi4AKLU3Ae9Lu08/BiG20gNQkebsckS4JbATBdpb7CW
	mJVWlJaOx0qLhcsQdBjbVE2T+NYcYXAKosSuurayj0WydGyRdOiaauEXqIf/EOyI5ZUZUYgg672
	C0HzKbv4o7X3GhBQbkMNAlOBpj8scfUFiA6dHr5uMXXjrrHXEm1QHGS5lRHdKjWKaW3T+DWxk0Z
	ulwu18GSmJsSKBe39T1qJTn80cR2zdCTLPOWzQYX/QPu5qtAQGMmunRPbk=
X-Received: by 2002:a05:600c:5850:b0:495:406f:dff6 with SMTP id 5b1f17b1804b1-4954a4106ddmr158406875e9.33.1784651847876;
        Tue, 21 Jul 2026 09:37:27 -0700 (PDT)
X-Received: by 2002:a05:600c:5850:b0:495:406f:dff6 with SMTP id
 5b1f17b1804b1-4954a4106ddmr158406685e9.33.1784651847465; Tue, 21 Jul 2026
 09:37:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721102827.313208-1-pbonzini@redhat.com> <20260721104819.B5A101F00A3E@smtp.kernel.org>
 <al-PSX0sOPdYdvIg@google.com> <CABgObfbL3t21yVeSwiLSjjOUER+rTYDPHYAH9YU4TWGRjx6XHg@mail.gmail.com>
 <al-d7WPocYgEtgFU@google.com>
In-Reply-To: <al-d7WPocYgEtgFU@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 21 Jul 2026 18:37:13 +0200
X-Gm-Features: AUfX_my2pzIWT0klO9x4--we7SaT18jk2dGJ79eGAGyiguyCxBNpp9RUjAdC1qo
Message-ID: <CABgObfa2C0fk4JTVPduZmcFnyyxsOvJfBS1s5Uzgf1K+LX-OEQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: nVMX: Hide shadow VMCS right after VMCLEAR
To: Sean Christopherson <seanjc@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bmDJgputbb_O8qOCCD919exaeJioU72s5WI7XObkdNw_1784651848
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 6:27=E2=80=AFPM Sean Christopherson <seanjc@google.=
com> wrote:
> > That said, I am surprised that VMCLEAR/VMREAD/VMWRITE/VMPTRLD do not
> > have a memory clobber, since they access internal processor registers
> > and the compiler may reorder them without the clobber. Fixing that
> > would also work around Sashiko's complaint, so I guess we should do it
> > anyway?
>
> Ya, good point.  We should probably hardcode that into vmx_asm1() and vmx=
_asm2()?

Definitely the easiest, even ignoring INVVPID/INVEPT...

> INVVPID and INVEPT also need the "memory" clobber, no?

... which strictly speaking do need the clobber, but in practice their
effect is only visible to the next VMLAUNCH/VMRESUME so the risk of
bad consequences from reordering is non-existent.

Patch going out soon...

Paolo

