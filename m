Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EC33DAAAA
	for <sashiko-reviews@lists.linux.dev>; Tue,  4 Aug 2026 12:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847690; cv=none; b=ghBYGJ82nfDLzCkoR+x56LEUqT0C/SB5AdLQjm1WeZXGYtWDszSDsK6GiP9Yu9nXSJzWnutD0KJUbq5l7nURZq5aPHJinHW7ODjQbbngUq79GJblZplSLr5hSzHaYGsvag37XqKvRzj42l827+99RaUNOMMgxpUj6Jvcvc1axeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847690; c=relaxed/simple;
	bh=V/8cjqgBsD+OEloLI1K1iMex5eqU9Q1Mx8Om0dbP7sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dRMEIZza+dwQO8RgaOOyopzc8Bzi5/UIK/Y+ORTp5IFWgBhKBOJZcS3j6GYAH/4L0WW4mgO9gQcix2i49F6jm9zb93pCCCuN3g2Wntdp92FQlvNJsDQ/MQEqBiI0YCGJ+isL+457wXnC1bwKVo27nqyOV3Hhsqm5kprRoC+pQcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ow4TTe4N; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ow4TTe4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785847687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V/8cjqgBsD+OEloLI1K1iMex5eqU9Q1Mx8Om0dbP7sg=;
	b=Ow4TTe4ND3rOojtIJ0d+ym5S2v6N99Cwnckr2cJRswtmsUdY0xvGsh08M01DV0VuFe4Wy6
	FFGz8pY+9HRcaGzQTEgwu6h2v7mWzFBVrI0TGkRbbi3JkcJMKy/f6ZDEqiw2UkAQgkRwIg
	3tMSijIkhkFcx4xp+VMd5bRwusRw7xs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-GwRlr36_NgSQNuGT93Ee9Q-1; Tue, 04 Aug 2026 08:48:04 -0400
X-MC-Unique: GwRlr36_NgSQNuGT93Ee9Q-1
X-Mimecast-MFC-AGG-ID: GwRlr36_NgSQNuGT93Ee9Q_1785847683
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-47f810c8aebso2786515f8f.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 04 Aug 2026 05:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785847683; x=1786452483;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V/8cjqgBsD+OEloLI1K1iMex5eqU9Q1Mx8Om0dbP7sg=;
        b=YCXP6GoP56lMyQrAcEdRoNfE4oc4e8VhHi1c6xkNETBHfb580AJLTi5jZ5dylqVowH
         xa5N8hN5EvgurrIjYPPNAH0fDXBamsBcXKv2AnqOgm1Oy8Aa/S+PjgQIiTmTfCY8wDlB
         iDGoSQcpFS4rm+w+lwtPG0+lTFHEHTRvwKTMeSqg0PLFniZF0AsDb0E/1S3Cs6lRwLoX
         cPZiY+LNTH0bw+3ETdWuSFX42WePyrRSVGwxy4dOHJvlu5PB56Fc5VftvwPNCy+aMHi/
         23KjuKzSA08Ev6xVT6zIOapgaDaa+s8GKIrfH3yLiVXtCGdytFsLZ/L1IpAEKsOCutql
         vrUQ==
X-Gm-Message-State: AOJu0Ywi4T1kbWC9l9WkNGuBElf1/NyhgyjcDMxz2sCnH6U5B+AEwOSw
	DCI1hPzeNSI2CvW3bMxTLnIja8T78+atifK/H05jZc+r+ETsHNMytRlWjgAMD8hGGDYMgE/xtD3
	YqNl6HAu/VpusG+qFOROapg6Fk/tG73g+z4ury25UdQ2hhxKCFDo6IN9wvK7SvnMXFQ8Ld25OUJ
	+Hyg59yOL2dBLfnvlSpfJNkaHP7M77w/TGyHTQ+gxpxd3YVEjpJguhf6c=
X-Gm-Gg: AR+sD13pZwdg2kDFtL5ZSjYPwW9NwxkkRxlJwW+T8nhIUI3Tqiw8lyLy4W/40RPIhr0
	SRe34qEXuhHRGohu17kUfFwccY9znQxO5nkwDoEVERKQsHtS/jqIHN9ODZDSc2eeXLX1m1EEu43
	l4kSAbuP/KkT7UjUQi3v1M4CCObXPsMPJe/7rcboZlKg5/t/zfj9OKfihBU9agrCMsapdYUqJxZ
	lRXGpm8ZRA7orypY+tD9Hz8vNwa4IFRr2KpC34r0QAYOpLRztpp9NzEtck=
X-Received: by 2002:a5d:6347:0:b0:47f:7b75:9dfe with SMTP id ffacd0b85a97d-47fd72ba981mr33399483f8f.8.1785847683361;
        Tue, 04 Aug 2026 05:48:03 -0700 (PDT)
X-Received: by 2002:a5d:6347:0:b0:47f:7b75:9dfe with SMTP id
 ffacd0b85a97d-47fd72ba981mr33399406f8f.8.1785847682947; Tue, 04 Aug 2026
 05:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804120529.1730187-1-pbonzini@redhat.com> <20260804120529.1730187-4-pbonzini@redhat.com>
 <20260804122128.838941F000E9@smtp.kernel.org>
In-Reply-To: <20260804122128.838941F000E9@smtp.kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 4 Aug 2026 14:47:49 +0200
X-Gm-Features: AUfX_mzc1UECOTjr13bdYLDwoSBcmazBIfNKBtso7fBXqj8NWhSnjvnTNjTJWfA
Message-ID: <CABgObfb9-cEUykbZD5C5LMz8Otk8hJk-OCzgRq=HvU3-s9NSVw@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] drm/ttm, drm/vmwgfx: directly create writable PTEs
 when mkwrite is in use
To: sashiko-reviews@lists.linux.dev
Cc: Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	dri-devel@lists.freedesktop.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jw304f3i9yQkEjF53VtohtOGXRR2UZa1STnL-asKTPw_1785847683
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 2:21=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> New issues:
> - [High] Missing dirty page tracking in vmw_bo_vm_fault() when prefaultin=
g fails, leading to silent data loss.
>
> Pre-existing issues:
> - [High] Inverted error handling logic in ttm_bo_vm_fault_reserved() hide=
s primary fault errors and propagates prefault errors.

Fixing the preexisting bug avoids the other issue - I sent a patch
separately at https://lists.freedesktop.org/archives/dri-devel/2026-August/=
586696.html.

Paolo

