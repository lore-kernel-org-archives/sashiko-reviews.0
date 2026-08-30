Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE018391E78
	for <sashiko-reviews@lists.linux.dev>; Sun, 30 Aug 2026 09:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788081473; cv=pass; b=bvH9CWeb4nc8fV+0y9HLmkOcsqhyOytpEHqFaUApNUtaMpmBIXvOMmJ+hqyKGkJSsC5zeK28oppt5duNXI8IpzElfZk+1YBVFX7amSSshLRUvR+jJWQYaspG6H4cit0MHEgn1f5/5fmE0FZJkGhp4uKbdRpcmRORycHZJPTYumE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788081473; c=relaxed/simple;
	bh=+nDvf1vITnsfEPkVB3AAZRrnHIkG4rMS6TLWYJdxGJc=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ISAUZ5LMSryk0UQgOMSwDRV0BYoNkKFpvuYlnYsBIEhgFLFo8EZfRiz51eJMmsHL5Th4xxCozhfNO5JXU0URuy8Wfp0YYELEVYGcHrzHC1qi7miVsGByAquDpvNsKJuJxicf9lD0JqESZ6tGSRgMclhgbe3nX+Wkk7XVzHm/JMY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DM3CCEzJ; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DM3CCEzJ"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c160420289bso326512466b.0
        for <sashiko-reviews@lists.linux.dev>; Sun, 30 Aug 2026 02:17:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788081470; cv=none;
        d=google.com; s=arc-20260327;
        b=quFfjT89swIQ7L8fiN8sKpylKzMND9/8ZyvEXLhGfzOfUnzZpFD4KEF7LpSVHZEPmw
         1cCejeBQu3D9uctuM7a4MEXkbJOhZlSQ2/hWJ/7Fxrm9azhd7nsSs5VpjKEuoz90si5Z
         NfslgS8opPn0/gCaSqofJ4Efxzl5WUxgp9ul+EpBFCgyHd0rfGbNsu49je0E0LeMUC3f
         7slGtX9nJJnNg0Ms6VfrSmfx81yWoqzvWXbRsM4Hxh8inAH3ov0fkA+JJ+u67aqEwBM+
         ofDV22a+5kTZ051ISs27mkEAKkR9tvfXIzJGxtPXKXaT3Q8mkAbZbJ89YcwLJ1hyndHu
         7lhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=+nDvf1vITnsfEPkVB3AAZRrnHIkG4rMS6TLWYJdxGJc=;
        fh=/QP+n2O4Hyc4wPS4zFFRlhIZQ4uvqm/l12+HjjpmfsY=;
        b=cetOfBIf9mYsWIoaVZw0B7qPtJHoD9nmviQfpwfXEgLzWMQ4THG9/GQUz+X2aEIM6M
         JUxOmjvGMG/KcHorJhI8w32WlKigVkJaHV97ppHobfzI+v4Gr3rlwOx9e30I2wjm4isq
         ofQyYE0/SRbgeoZK9km/fG8SadApUH74YJtlj8BNSdmuPa3/5qoLwTUpsVSWoasbwoaC
         k2TAjU5kohJQ4ldIDcCroBz+d/cUfjwKwO1vZ3LFKwm+TeulhWAI4Eqq5zgzKEVAAK1y
         RnnmsRp9uxja5kPX/nW/BTwWwkuQJZI0C3QH77XB6xmVm6onI/0T5Bt6eD0ia+2EGc+r
         BJYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788081470; x=1788686270; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nDvf1vITnsfEPkVB3AAZRrnHIkG4rMS6TLWYJdxGJc=;
        b=DM3CCEzJX+9dhYZsXUQAjRJ+sx/T/SiP29vHpW9+zA3awLCFXgJoD4Ys5nL/pXmoCV
         YptBcmGFkv+EknmLBnRD9nu6AeVA0M8LVOIhhMj/RJlndywS+XRA6L/WOAlmpER2UTwu
         AD19p72FTMXKkQsAGS1ZxVQ6XKGPn+vd4r1AtthJcxqDllKVzVjgrCPvf+6KjRtSA5zA
         IARmbah7evuK5AMkup5bNyCKAW0fkn9L2BGojLqPo39cszIoRISIh/KvUcOMRx9R5QOz
         nVHxU0rjB6ZjLEe6YtD730yZoK0tHVRehtT8uAqakkxOjc5s5lx9ySfDHgo8yn/4tI69
         9PYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788081470; x=1788686270;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+nDvf1vITnsfEPkVB3AAZRrnHIkG4rMS6TLWYJdxGJc=;
        b=aeb0clcpvGzYryS3bsYHmvORVE0bUvQ1MtCtCBfSczl0IlXwIshQ4JYIqjHnSL00CS
         6bpQdxbKJDarGxOqGrsN8YT9vC7AN2C/7+w1dQO3G+jBPPk56sxCKS8h5b4JDB2U36us
         MlhVAzFDLNfk4JrPk86lYCgIOLOLXj5qR/V5IVZSuaeE2FEfpv5KDIX+GJ9j+UrPMih7
         1jUhQqVIlFQItwOPBP+iwxocuHr9lSH3QNA5HkkvENWHjodezQYSBiqXeWlCHiLhAOXb
         jBNnfaI/M9j5cKN0XjIE2GgoSaXzYb4LXe4tKx/XSH4PNwDNx/lqLgGKmoj5SXFOuGcK
         jKmQ==
X-Gm-Message-State: AFuF++nvkErBgfkWzN98Yq0bjIq7M58HMjfmmS8yG9fx2WTmCKnEh/6x
	NAgYL4RUxUwm8j4XzkfYiWQNkg5m0BcDbeKsT6I4i0B7Wg6bOLoDWCR6XDXDxLcpbGZxAZLX9zj
	e52vz08X/1LN9Im+ov5liSRsyyjOrKfRPEw0P
X-Gm-Gg: AR+sD13gFDcKEAL4dDaKjZ48DEtP/KMgPUPRKj/PYLg3elXdSuWuLOLB7Ijpca1OFZr
	N2bTwK02xrborW5+AWiufkRQGAfsDb3TkW6d8k6KwAAhM/vNqVjIc6I4sPi60B/XpeX+sGpf8I5
	jVqX0wmplUyq0EeOxWmQKIDtz1jXVzEQHt8g2egPpd9ihODZEdnqQUDqnOfDUex37gcTgh6rDf+
	LLbfzir7MrZFxV9iY21XQVJXfHTkOVHhMxzoBe678eF9IFgCCDmD6c/Ivs8NPOiJo9RGPxk0GAW
	22uhjUyIg2rFDdRe8Q1wQJRjqw107Ghsb15+YNghGs9a5uc=
X-Received: by 2002:a05:6938:a086:20b0:c25:8c05:902f with SMTP id
 a640c23a62f3a-c258c05937amr113786766b.13.1788081469563; Sun, 30 Aug 2026
 02:17:49 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 30 Aug 2026 02:17:49 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 30 Aug 2026 02:17:49 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: sinyavin@gmail.com
In-Reply-To: <20260830090550.79EC31F000E9@smtp.kernel.org>
References: <20260830085340.2542624-1-sinyavin@gmail.com> <20260830090550.79EC31F000E9@smtp.kernel.org>
Date: Sun, 30 Aug 2026 02:17:49 -0700
X-Gm-Features: AcwNN1UELGVc8MQoksPCsuRRMHkX3Io-3x0bQrzBAvuDzU8QRYO3N2DGuVIc2xQ
Message-ID: <CADE4BHKCsqRZ6L1OCf7nvy+hh39mZMFtgaB1aysUfAfgAAoTKg@mail.gmail.com>
Subject: Re: [PATCH] serial: msm: select PM_OPP
To: sashiko-reviews@lists.linux.dev
Cc: linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks for the review.

Both findings concern pre-existing code and are unrelated to this
Kconfig-only change, so they are outside the scope of this patch.
