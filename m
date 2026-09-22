Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528E0376BC1
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087207; cv=none; b=hu+eoe8oiRMGwOe6xxPgdx20lIMi1fZzLA+KLj0E/Uce4FaZw40hrrh7geOn8jqfgmG6bNi2devD90Fnou+48BrE3nah8PbTaOvHJD0NDhH3g6KRwubbvkPuTjRh3jSCPNCwbpASj5GXTONSgEgIemiB7tENBidqRMFVu+IyQNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087207; c=relaxed/simple;
	bh=Za4HiTH5fd7ZrTkBdvju5YhW4OO6kkXrdIMnFfEsV8Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uL+GPoafa8Lx+J0OAjFkSnkbET2KdPEvMEh5XhM2dYHNvItZCQJYd+vWhvX96YclQz5ir6KjlG2Tt8E5fjy0ilDcwx4EDSdQdAQ763rpIHsAa5F+/GZCnlzs6UNbe052qoQqscL6LeAvRd8PYT88vmm2I/NZlmcRq7jZbfy1wn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ffB+SqdM; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ffB+SqdM"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a74698972so4837250b3a.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 07:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790087205; x=1790692005; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NMCpZ+rBKmM5pPV3/1AGo5Sjpxhi2AiAh3yEFMHYDvA=;
        b=ffB+SqdMBKXS9T2+2/dFVTUUOZRM1UXsnw4wB1rLYK2ZI+O7NkvELC7hZIos0FI7A6
         cXuph+bhV0BA3cKQcwmKh5o93a5M82N/TCZbYK3+cnYEdrKClCBmh82VVVCAK3Wu8/v5
         7YGS3EwbIuXCjp1WS+6wPcpEiush2yHbHO1LS6CchpdDGbCJaYadUgVQaFC7gIV/Cs+G
         fBfD18xT8CFv72w+vBLhjTLJLcFBFnrHf14lWSCtfG3kXwTO+k9TNWGUtkEK1aQ60Sxp
         E3vpklwwhlImJVGJqQ5BOTuDVoBu1y4vUWAHhlo+R9EGi4fFdoc3xmwQFguI2seeWHir
         vz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087205; x=1790692005;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NMCpZ+rBKmM5pPV3/1AGo5Sjpxhi2AiAh3yEFMHYDvA=;
        b=m9Fv4tv5K7wmfHHEWz6BTZEwpoKsZPXyd7sI1R3AmWPH5oLDYuSS4tzR2YdJJlLmSl
         EIpW3psTM4FCOcFlKJ6KTeHGiXjw5L2ky6yhY8D78/vtTtQ58CVd5BdIZyqHYPKrcfHM
         AsG9pBI+zQ+DVWpwtFcgnAHPVxiF+wAbz+fOD/HCYg8O1wqDzI6uj1Dgw8zyhCAS8Qdl
         FBWK8dyqvMVm/G5+wmVnWHzSOs9+7o2yzvBULtv3nZWtUKZTisFWCIIXFrHP19CRnknp
         MvDCmpsxiq5CY11C7wiSj2Q9mtLoHBKS6IqX7zCXxvnhKQUTpDH728cBBv19Oi6uopgW
         hGIQ==
X-Gm-Message-State: AFuF++nRspV1wC5yFJHujBdGeYDn7uLIyrG7CfpHokiNXZG8PySqo8FT
	YJ2Vkrpib6OHpHZIjyZE9/ZQzwL4qDv9q0J4CFxtJghBODI7sg00vf7jVsweWfuUFa24RNglTsG
	hQC5fLQ==
X-Received: from pfjw17.prod.google.com ([2002:aa7:9a11:0:b0:87b:4362:1067])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:4b4e:b0:868:e6d3:fc18
 with SMTP id d2e1a72fcca58-87c8249eb60mr1475498b3a.15.1790087205245; Tue, 22
 Sep 2026 07:26:45 -0700 (PDT)
Date: Tue, 22 Sep 2026 07:26:44 -0700
In-Reply-To: <CALMp9eQboC6DTQfa3N58XCfOLf-qwJ2L7dC5vtqDerHG80eZLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260918154530.4129698-1-jmattson@google.com> <20260918160109.E76B81F000FF@smtp.kernel.org>
 <arKJQwAPvApkeESD@google.com> <CALMp9eQboC6DTQfa3N58XCfOLf-qwJ2L7dC5vtqDerHG80eZLg@mail.gmail.com>
Message-ID: <arKQJJJB8HMK0B1G@google.com>
Subject: Re: [PATCH] KVM: x86: Disallow EFER.LMSLE when EferLmsleUnsupported
 is set in guest CPUID
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: sashiko-reviews@lists.linux.dev, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026, Jim Mattson wrote:
> On Tue, Sep 22, 2026 at 6:57=E2=80=AFAM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > Gah, I hate the negative "feature" bits, I've gotten completely turned =
around
> > multiple times trying to sort through this.
>=20
> Me too!
>=20
> > IIUC, you're trying to "fix" setups where host CPUID.EFER_LMSLE_MBZ=3D0=
, but userspace
> > configured guest CPUID.EFER_LMSLE_MBZ=3D1?  If so, then Sashiko is righ=
t, it needs to
> > be declared with EMULATED_F().  I would even argue that technically thi=
s isn't a KVM
> > bug, because KVM won't advertise EFER_LMSLE_MBZ in KVM_GET_SUPPORTED_CP=
UID on such
> > hosts.
>=20
> I'm trying to make it possible to run a Rome vCPU on Milan or later.
>=20
> SInce this is a negative feature bit, it must be retained if the host
> reports it. That blocks running a Rome vCPU on Milan or later.
> However, a defeatured Rome (which reports LMSLE_MBZ as 1) can be run

So, a partially defeatured Rome?  Because it sounds like the CPU reports LM=
SLE_MBZ=3D1,
but then still allows setting EFER.LMSLE=3D1?

> on Milan and later.
>=20
> It's the same feature-hiding we do all of the time=E2=80=94just inverted.
