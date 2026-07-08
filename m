Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC43E39AD49
	for <sashiko-reviews@lists.linux.dev>; Wed,  8 Jul 2026 23:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783552238; cv=pass; b=cBS1L7xJrwz3mNu5Xnbq5dVcxoQuXFbLfDg0hTzZGOIiZQ/S5Wg9nu4Y07CHsWiNIkVpDNw4r/tu9glbqkUsCjMpaf+Z3Q4KaRG7pmQOZnLGw/4WFWZWmgy5GsZup8N3zRQM2hkzhVZPfLP5kjeD9Czb0cb6ZK19rtmm8IV/dqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783552238; c=relaxed/simple;
	bh=fuSekuBjKILqAPLvqOFzDcr92zIdJEnUZcXyUswaVxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NAtgqZANu0XHoBLUeAQpUYJCyoqd2bZmb5j1Ptcmet2gB10ROwdCiqiUKKxfu8rdoVD9//1UnoQXWlpqNA9IVrp76gJHoNZ9ezDPHrSeehS9it39pQ3jy2yzSASFY7pgtqn+kH0X8wSi3pBFnGvSypqVrZn71Yoq25zKpJeYXvg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RkNYI3Ji; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RkNYI3Ji"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b0077d7053so1660e87.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 08 Jul 2026 16:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783552235; cv=none;
        d=google.com; s=arc-20260327;
        b=kXSO7I6b1v5lqUCmqlHS1g9EsBhQBKEkgjG5aEX59uCYa+LYKrmpuBkEmH0bA3WqRn
         5rDuJykpEPgZCYYbRVxKE1ul5zuI+xaG7c7KXRhoSFfU7fcwpfOo6SwXlK8yPhLOeDnu
         bpruAj/v/mbVP++5mEX/xgFotEAQGU/R3MflQszjt/CTWB/+89XueI/AJGcRlfceeBmA
         +DhKYbdN3om0x8KGawS6UkpVkdU2kvH/FqhSKvSaYWl7KzOHJcQ1W+osvSwH6dMHnlsO
         S+W85aN1EBp3sFWislT1lNQK+mXppXlwegn9GUcN4WD7jLN7KdU2iLsCwmjlV9Z/LEoS
         mdaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W3OmbKP/PUEUuyDu0vTsEzSc6oVHraO2SRuCrscetMM=;
        fh=ibSBef82XuJlXSL2k986w2vOvUTF6FKb9iCGCo4Ew2s=;
        b=eQm0qfzNWx6Yhii1T/CxmU0cFyC8+IMqaxdARXrbmTcXxI0p3dXSJqu9HLcf4TW5Wk
         9cVpiJKU5Ql02yxsP5Kw8MYXOv6enSNrxqw0QjwwlQomKrhMWKjolHb/DR1QnhRNvsh+
         b4lYaS7zTkyiwuc463AZXLKzDwR5uOMUUutg/hPpEf3c5XtzVLyMgJcn2EN3vKKG1Sx/
         M0Wz43SsZDlUlFWAiATyKNtOJOSNu8tMMG96aNWpFcXmnkct0vNL77FAhSVV68tXHxo2
         wsyVz2VGBS/Mspts1sNLTfLt6NeeWC0Ygpq570KBbmveLzHc+0dZIpB0EV/3hv9+UChS
         UQxw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783552235; x=1784157035; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3OmbKP/PUEUuyDu0vTsEzSc6oVHraO2SRuCrscetMM=;
        b=RkNYI3JiIYzOlKdnRFBQK9ZNqP7Er50H/FuDV0kHqEB9/S9IWYLzZ2DrDaoSzDnVYc
         d/t1bwzfKl6ArZkJDjycu5JhLZTUG0HE3HMggENz+anYofC3WNphhVdHHNzhhp2G+MAY
         gRi3gahEFa0p0Ky+D0UNRWYAYFPOcIq8mH1724fdQADC8M8dki1QKRtE3Ot2zO3CiH4G
         QToYtfFWosyH9Q6aj0J0Yah/MMEZEBDxFbIbcyaUnV3g5GlMbtwqqZQ8kLZh/k1ntwCi
         yan3+MFlzet1bJ84cmf5Frv3sYA3ZgzCVVQ998NGp3Y3d7ilgNkgOtm9qFhaeS2lPZoZ
         3qLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783552235; x=1784157035;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3OmbKP/PUEUuyDu0vTsEzSc6oVHraO2SRuCrscetMM=;
        b=ltS4yLVii6bq8at1ckbWpBrog0GsfISWsFaRhnHbWCdrXrpewq7Y4kHyp5KA+Ao7ZP
         j4ProjuqBWKqDhGs2RIz37jFYC/TiyKoMbJF2tNWGUDkUous1PJlvtpv3MzjVG21s91D
         CF+gZGbf+ZFekmX9p8ZLSUre7rRgYxZJzQburcNumCFUjJEqXipFTOi0FEIinJ1C4oIX
         7xDAu29MYyD260e6i1MPA5qcnSf7/3SLI9+2pCk/SEFKvoaShnrk5PQt/l1kLl9O+SXu
         kgJ7Xp65/lBp+50CYRwMzgLkCgMyj7Q1SY4Qjof1mX9tU8mRAb94hE9esDD+J3Nbb2OQ
         wpQA==
X-Gm-Message-State: AOJu0Yx5r7yS3LAC3olbpe+MpD3pzILrgRPDSRrYeECTRvbEVoMokcKd
	OaLkNerrVGGv/cXhi/b+KSm2X5kU2imsagIPLgPWnCGRH1IOV636FVF09iSlz+zQcR/2OdIZ3/A
	VuH7lCHJ/5S5PMDTFkfRJrVkFYYnbCyFE06i18wyo8A4sbHyLB4Eb/+EwAQ==
X-Gm-Gg: AfdE7cmd9WWyJ0gymTOuVOhLzjJ6jbSxw5ybdpyu0YjhAkfzHGfn9c20bINU40hDPgd
	p+IHD4JCNJNXDpNbI5A8fTQj9ZJYjZHsKFtvCnSMr0ANXTQbvjbf0uhLDfBp5ePKO3ZoexBtrF2
	uV7XCC8xq8x9jNo2T1pn62Y1YVTEDQXzMsb8UdI6Ocf1UViWR8jnqGFpr6S5WayHCLU9j6ueCVA
	94eSaxI2x9k/4f1r0BhT7FkH1WgjMgfKAfdYuwP/MJ97kcCGVRU3CFzouj93aWq4aJW
X-Received: by 2002:a05:6512:3d19:b0:5ae:aff3:3eab with SMTP id
 2adb3069b0e04-5b017608423mr8374e87.3.1783552234580; Wed, 08 Jul 2026 16:10:34
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526235417.2058313-2-jrhilke@google.com> <20260527003237.8405E1F000E9@smtp.kernel.org>
 <akwQUzGJBJhzdAss@google.com>
In-Reply-To: <akwQUzGJBJhzdAss@google.com>
From: Josh Hilke <jrhilke@google.com>
Date: Wed, 8 Jul 2026 16:10:23 -0700
X-Gm-Features: AVVi8Cf9fXyp5a3YiVF1dHvg0qfhetVGYcDZvQHgpDZJCeXn7xt0skskI5yc_RE
Message-ID: <CAAdrzjtQBwXZn=sx4gbUxfX5cCoirfv_tvGVPOopLQYqixTpBw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] selftests/vfio: igb: Add driver for IGB QEMU device
To: David Matlack <dmatlack@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 6, 2026 at 1:30=E2=80=AFPM David Matlack <dmatlack@google.com> =
wrote:
>
> On 2026-05-27 12:32 AM, sashiko-bot@kernel.org wrote:
> > > +
> > > +           /* Set to 0 to disable offloads and avoid needing a conte=
xt descriptor */
> > > +           tx->read.olinfo_status =3D 0;
> > > +
> > > +           igb->tx_tail =3D (igb->tx_tail + 1) % RING_SIZE;
> > > +           igb->rx_tail =3D (igb->rx_tail + 1) % RING_SIZE;
> > > +   }
> > > +
> > > +   igb_write32(igb, IGB_RDT0, igb->rx_tail);
> > > +   igb_write32(igb, IGB_TDT0, igb->tx_tail);
> >
> > [Severity: Medium]
> > Are write memory barriers needed here around the DMA descriptor and doo=
rbell
> > accesses? Without a write memory barrier between populating RAM descrip=
tors
> > and ringing the TX doorbell, the hardware might fetch stale descriptors=
.
>
> Can you look into this one? I would have assumed writel() would provide
> the proper barriers.

You're correct. For x86_64, writel() includes a memory barrier. Here's
the definition from tools/arch/x86/include/asm/io.h.

build_mmio_write(writel, "l", unsigned int, "r", :"memory")

That memory barrier should guarantee that all the descriptor writes
from the loop are visible prior to ringing the doorbell.

Thanks,
Josh Hilke
