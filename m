Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF6B47CA74
	for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 17:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247102; cv=none; b=OEUIMPs3PnOxV4iyuJNk0K+P93rvt3wUcXNka1LhM4zZaHT2oZQ+g1JSYRtbsTfdBIzjgLzCzW3aG1CP66Mn1p8+kjdFdvhQS4YzEf7bcAGl9UoAB+lta3T+IjqI06vqDQxgmRzD4f14Xpaje8TZ/gv2eZ8zSPdNkyav4g4M2nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247102; c=relaxed/simple;
	bh=KRvUWZDGEUMSwtdyPJQ/5FEouBX9ts8IqZ+F2bFuJWM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nOKP2i6HZSfrH+jJSKnVv+ezG5gT+yK3IuLQkth4QqP2FC2VLSIduUqt7adNBmH5bK3fHfqUbm4rz2544yNbL2SKHcNHGOGj8x5RMm5/3+KdmN8N1UnXXqJacv4Fx0hhjs05W4RcLtfVqAtYcoKxFTc8ZvOxmrq99Yr7qDdleEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c4HIqC/i; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c4HIqC/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787247100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KRvUWZDGEUMSwtdyPJQ/5FEouBX9ts8IqZ+F2bFuJWM=;
	b=c4HIqC/iOpD7Lxk1NmkxR3cWOoLPeX6m4J8+90JAEpgejMvrEul6m20MYpghqgHy/F32MC
	jFGp7oDWo5j9lyk/r2tVtOzfZlMz8iqQlrRQVZ/+R2h2tdnksp1HbSlbqEt0anO5DfSAtQ
	+6dJP2xEqVqbkf8uVmU8xl/nr7GaV80=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-9YG2IAPNOcqMR59TFwZQkg-1; Thu, 20 Aug 2026 13:31:37 -0400
X-MC-Unique: 9YG2IAPNOcqMR59TFwZQkg-1
X-Mimecast-MFC-AGG-ID: 9YG2IAPNOcqMR59TFwZQkg_1787247097
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52769fc3f2eso851571cf.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 20 Aug 2026 10:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787247097; x=1787851897;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRvUWZDGEUMSwtdyPJQ/5FEouBX9ts8IqZ+F2bFuJWM=;
        b=JaORif6EhisAwna1vV7Vk0UpYxEXjMhtbTSajSnGTFsH77R2j2BC+wy5PnwnvUKttz
         mc7zWAg1y42K3VCAeY16y9c6JTCyMwHjLSR90/f5WR0gOepnqQ8FxWYXbnh30ua2Xnn9
         v94atnAOLZmPF5AhyuFoNa4FZczmwTLnw+wm13h5PDBv7EwLHdL9TeeZ4trTqnIKKLh7
         DGnF3uSfHWFBOJl3MywR1jeI4Kljv/c9d+pyoyGi4s+WSzLWCynFAbHtfnkcTcoiv4lP
         roXUL0C/7kVizz31P9lyrPPguER+4AZpxen0XXWIEP7Xzni1mKnXzbXV8SIxPLD4yBYv
         nYlg==
X-Gm-Message-State: AOJu0YyehR29855BzDIwYE13OFMoNK2avTIk5sysWmUrL+NFbm7VVBoM
	AcqGz51OKoHrJ8EhNCOwNBUCxhDaqCYLUgrF26Zogp7mvfxod/vAPVrUuJDbWYH1AF/KsOrbDmO
	LqeKW23rkkSHFQIuIyJ03mUb6WhxK5cVUbDnFl+lkyIvpuQp/LC+s3RsCNKmVQjAU39VydqeDNS
	2XVaN0FhrJLiXgM9qBBCNynxKNgLBzyN9gwLw8pDUJJz/STJg/sg==
X-Gm-Gg: AR+sD101MqskYhMcnO2AvL4omMyKGl98XpyRyvxphuyo+wdG8/hFatackm4qZaH9oyL
	W+du0IjcgZbQ+DHA0sgKaEkhwQW2UCIgyVh9xMDXF/lV0xsYBKNz34C8ZrZnFwqGfTpA3/G6/hd
	+5Yt5QwlKP10hFOqHdPM5l8osNBCLntAms/COhZOSVL1t5UF8edSevnLMdaWcL1vBeBQsxm2IBH
	yTVKZQ83nYJWn4VVPpi0kJ7J02LbTYwmw0/CSHfKNhWK4RIExG+FmH0CVwsYGLXhqCs38WMlN6I
	0Iu6SYugZpNf6YSNHWTzZqa9YlNuWUbaJL5Z2gNvTF+WCtOzv7XV4VMrCdEZCfZHNjEjq1eO
X-Received: by 2002:a05:622a:514e:b0:52d:ce1e:cd47 with SMTP id d75a77b69052e-52dd5783cfbmr148948871cf.9.1787247097205;
        Thu, 20 Aug 2026 10:31:37 -0700 (PDT)
X-Received: by 2002:a05:622a:514e:b0:52d:ce1e:cd47 with SMTP id d75a77b69052e-52dd5783cfbmr148947671cf.9.1787247096457;
        Thu, 20 Aug 2026 10:31:36 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2b5a1bsm43204606d6.45.2026.08.20.10.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 10:31:34 -0700 (PDT)
Message-ID: <bab55a285432b1b96a74760146963b29f5c7d7cb.camel@redhat.com>
Subject: Re: [PATCH v2 6/6] drm/nouveau/kms/nv50-: Obliterate
 nouveau_encoder->crtc
From: lyude@redhat.com
To: sashiko-reviews@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org
Date: Thu, 20 Aug 2026 13:31:33 -0400
In-Reply-To: <20260819160841.31C9E1F000E9@smtp.kernel.org>
References: <20260819155934.154125-1-lyude@redhat.com>
	 <20260819155934.154125-7-lyude@redhat.com>
	 <20260819160841.31C9E1F000E9@smtp.kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: s8l0CiTZ6vKXwSyk8lCqenRNZTQ1vfsjR_lxfykadJU_1787247097
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2026-08-19 at 16:08 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
>=20
> Pre-existing issues:
> - [High] Encoder atomic disable callback calls a sleeping function,
> violating atomic context rules.
> --

Again - another hallucination. It keeps seeing the word atomic and then
recognizes it as being a word mostly around contexts where prior
reviewers have pointed out sleeping wasn't allowed in said contexts.
Nothing it is commenting on is actually atomic.

