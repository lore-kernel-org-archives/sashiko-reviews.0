Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745FC3F6C50
	for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781183201; cv=pass; b=QTLKSHrJeWWfe/nneABL5fKfXKoERx3F5hgpS7++AON/5myZJouaSRCjWlN2Gc3hFoAc0JYB3xmlOg8fx5hWKebMxBePUObrZ8Nrl70qaAgLlfJRQskMdX0BJVUeS8Q8J8zBJYE2g8pB4p8kuN2C1IcR8V3HEwLR7pSwxqNvLYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781183201; c=relaxed/simple;
	bh=FQ6RSVo6oDa3NIfB1iqCtoD5h3yerqQvx3StG69KPcY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UqxLYKljRmLL+oHn4sfbLFZt5XmOizroJv7+oA58FUdc+JkDVld8P7piCw8ytIxAcLI5y79ucVNc/X9oDnpE+NaXQWGStv3iekFL/nSyjzgKBXVY1lq0oL2AR7vTeZ4zWvVAqFAdAiDiQ9T6e3/Tmu5LfZXU93bNQqTKw7pCbz8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dd3TGL6A; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dd3TGL6A"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36b7b7b7a80so417338a91.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 11 Jun 2026 06:06:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781183200; cv=none;
        d=google.com; s=arc-20240605;
        b=TjbyrxVMO1R61SXFABzdOVcY/+6ChiCROwI6FxgIwYO9JmRJ6rVo7Hs360eg7oMSj9
         l664fo7tIvZknRLcoDBRsabho1gLGXBlXrlZijZ1032R3aiRfREZRvtLjRFXU3I9RTH3
         n5/VOVL72ysbJpAXan2cLDUBZ0aeHat1ERD8QKYox0Tm7uqsEVHY1U662SZSaDp2GlOc
         iQCflMlMo+5rHK+iBXLGdpSe7O91Vcr05DRz04HlB2Yo/iXO6esoNOGr3gQ4vfoP9CZc
         0eHZmnlUa7S+X4EGhCF0OGO+69qcvSIDPB54BydJ0fhVc7b56QMUzbNTrcwvRrz8Hjue
         7Yew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sFNyGIT6G3ar5kcBIurFraG48CjU0mM8dnfLSCFPRJI=;
        fh=gUfsL9ppqjROwdjOOpA7gVU01au1qshFQ+BhECdF0Kg=;
        b=OGalURxbDuACHhgErqWW7Rh4khRw4eW29wLm08zkMxPkQI5MB3QJAHbN2BmJRcij+f
         zbAnVz7rrOWKhvCJTclySrHHFLk5sjrApYpz0ANpcwiV5HAhmQwAaqfc46wxMTJvG5wV
         f15r2PAELPks2k7RPcKJNBaISsIPCQa5vo2AZf2fmt0a9tladQFcmdnmQp5a1U7jQ9Wi
         GnGYizz8rIKjfxgSLQaUi8xnkeq9b/qp7IK2i8How0lSquHzRu3XCiuSDWptTahZUviP
         vBa1yi1mspX2mtacwwyWAEkusYxY9OBPCRZ0rG7NedYYwRTcYqPh/IGl0owpEMnzjGrj
         +SlQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781183200; x=1781788000; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sFNyGIT6G3ar5kcBIurFraG48CjU0mM8dnfLSCFPRJI=;
        b=dd3TGL6AxEwQfCy05Cujtr3H/QNgLZczU8hu2viQ72yngqKgeiOZDzivWYjd28MGkq
         ZrPruAelHpCbrknF2zyjJGMK7X9w+CJAQ8vSjUoHXXEHvm57Maha5LeBZkxiwSgAnroJ
         rqblybHhKokyVppnjSALsnvpL+PYmiyiAXWgNAzE1JxTFqUx0e+Ep1okJl0uA0qzuazj
         02n1pyJuEQ8aIdL4Mpm4YYZukgqTtgapg/kVxi9OmgPnTxOCGcfbSv48P4DF+PQ/zHC/
         Hjnug4jaE6Yx7eM9gEan7mO4gr/mEHJXzgyOxY6CDXi+xRTp5OGJ5IqncqhtUexel+BN
         WwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781183200; x=1781788000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sFNyGIT6G3ar5kcBIurFraG48CjU0mM8dnfLSCFPRJI=;
        b=jLU7FgQu2a4vIzz9lrp3Yjm+HTxKZpnMsJ+SBdpKH1r5p7R0BxHYEkJRl1xztq2Tqj
         zXQ1nTVIjdAGIPZ7VRYHD7NXVtSif5IzUMomoBF1Kfn0eEUbQsRzFHrJeIISIFZAF2+r
         yYH4hvbkQBEYACsNEC6VISKMsA8Fcglq99FbFPCW2QYvq9bsf7wbg8HKdbxG+QhOArO5
         hKdrveeg0CCV9/bsAKpC7Bslzmboh2N60jaOoYiHYaYsmBwasIJ1Bvk3gY/147hO/I/C
         6PZtjRjqWoThWiMDWOdZdz457W00DDMR+b/OtST9xxZ6o90plr8hab8wU7keAbWv5E6V
         AYDg==
X-Gm-Message-State: AOJu0YyR0GE/rFLLHbQBdL8JMcFBZCPROutU+Cr7zY/HFpq1kN0Ka86X
	2XDmDdMbnIP2ZxmAZIXfc6rse3Ao3nSiD4YQBga8hfgqkx4BBqJT+Ea+toXy0/dn7yY+cd7a0Mt
	CFVta01F3uhas2bRE3RmDuThozJo5w5sGtzCwH+Q=
X-Gm-Gg: Acq92OG6uEeGjHD3Uh5O1fKCYanpF2YvoxJF6HeymIP2Tdw/3yqedXQa5GD3cHpkX7D
	FxAyjE8NO9UfZGFFzazmnD9iLvqfA0iTv+5ujAHeucJIMqYUePpM0v4mr3vMi+SyELwIJeQH5hD
	41xg5jmjblLVSG80mcznGM+CdN1Y8VYglQ4nGoUTlHb/WmZc3IypXfMmk0x+SLIa4BbJwNM1JvU
	XHmBWiqceMOcSk6m07/E4jzJSCQmzMebGLvirKk61PW8fcqabNA+NYrxoFBNqYgIFtcGqGldorG
	uUNmjUi25IJD/flK93gNiVYVuvpIMjfH8Sp8PMRQRuDmSvc=
X-Received: by 2002:a17:90b:5544:b0:368:864:62ad with SMTP id
 98e67ed59e1d1-377ea842090mr2110841a91.3.1781183199819; Thu, 11 Jun 2026
 06:06:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611123046.2323342-3-michael.bommarito@gmail.com> <20260611124739.5C9DE1F00893@smtp.kernel.org>
In-Reply-To: <20260611124739.5C9DE1F00893@smtp.kernel.org>
From: Michael Bommarito <michael.bommarito@gmail.com>
Date: Thu, 11 Jun 2026 09:06:26 -0400
X-Gm-Features: AVVi8Ce14aVwE3vQiXEX7pA-nZk9qQ_7xULB3yO3IwL6ucdMxWq_3yV-iH_jJ2o
Message-ID: <CAJJ9bXy4VXYQwcGx-r0SbEQAfHGnzuPDcnUTkaTvDDxZoJo5VQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] xen/scsiback: free the command tag on the TMR
 submit-failure path
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 8:47=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
> - [Critical] The return value of target_init_cmd() is ignored in scsiback=
_cmd_exec(), leading to a percpu_ref underflow, kref underflow, and use-aft=
er-free if the session is shutting down.

My understanding is that scsiback never calls target_stop_session, so
per the comment at drivers/target/target_core_transport.c:1712, the
return check is not required here.

The second point is real but the only two similarly affected sites I
found,  srpt and ibmvscsi_tgt, seemed low priority and not worth the
churn.  Happy to send in if someone wants.

Thanks,
Mike
