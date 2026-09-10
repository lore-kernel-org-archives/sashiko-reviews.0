Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656D5470454
	for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 11:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789039005; cv=none; b=XNvpUeaRnYkMfdCAMz2srBCwM7YRGSgjTali/YYvWxNwUjVKH9hhKUOQkIkL6rKNnRIcEFXM6HdD4WfFMz7hC17TApDILffODO8tYs77sLvxI6JwDNL460SkaIHfmz330SKHxYJmyS51DNxJugz3HbpUbuisChTZdmNuo8O2GV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789039005; c=relaxed/simple;
	bh=RN+Hf6vxb/foo5YUnmGAfgNm2d6FeUBDjcGvLWsK3TI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GkNjtDPEsXZkZRcLvsyTXJy10hmPlukAmsQ7XldZ5P2ZeOSW3mUV94yIwJVbYbb9BTWEfH9tYvtSujbAtQTAvo663y/Ue210r252o2reLcHdP5Rb9nPBqTzoM90oM0CzA86zUUWYrjrMM4fx9J+eY7uWUYt+jlwWx0wCQVgfAiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BpuNTwAQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BpuNTwAQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789039003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2YIwXGsyCKQHxSzxIAQbVXvS5Mx9+nIZhzE2of2xmdw=;
	b=BpuNTwAQnK3qHtq+oAYnE5duhf87BwfbfE5HYRVTq83Ev18TWYUp5SWT17u+Y4eP56VBSZ
	4M5Dofy9ggw+mh/JtMjlD4rrUWTOfYVwoliM7HzM4AF1Syh+jAXENn/ZY4WJ8MIqyPaFJW
	6SZ1pmGogdiunwiqolXSJOLjPmCjeIc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-191-oZ4M2Z1VNJGwDseg4y314w-1; Thu, 10 Sep 2026 07:16:41 -0400
X-MC-Unique: oZ4M2Z1VNJGwDseg4y314w-1
X-Mimecast-MFC-AGG-ID: oZ4M2Z1VNJGwDseg4y314w_1789039001
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4843227cfcfso414978f8f.1
        for <sashiko-reviews@lists.linux.dev>; Thu, 10 Sep 2026 04:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039000; x=1789643800;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mtIFV5PhR8YaKeQBUyczM0xpE62wYImfp+kBJSJQh8=;
        b=RniOatj33pivO3O6Qtt3DKWfEPRM0D0cHr7G+xGkypXrhYWw7ptJYaBrgdk+AD+OGp
         SjwrolJv7+ETRlJqYmUhMzOdzliJTWcusShAZ5uX4U24okO/ZX2P0TJ5xrqpeqo4KChE
         Uw69srabmcyM2Iybz7mr70gU9J0y5THvfHp9v+z3RrVudp6GYlRIpxm+1q4sjAP5KH9a
         q9F+uKgHf0RbLRQ5foGtQLjg+Lwit+A0QAPT/sZNWmMtfWkClhY2jBTGbROD9oydHreU
         Bl1o4JEJygHjOXCjoEtH0rHhSiwFUGeQldM154NaAN2WJIvGfcqGUlL70q+O7rqPAs0i
         O4ig==
X-Gm-Message-State: AFuF++myBeJOc03ESs+ktazV4gc6u/wT4nTR7jXu2CToGxUCgN7IQE4T
	0LJt0/oyLcqSqRGUZC4Xhjx9KiS2TcpeWK/6R492dFghyhUrvJUN44x2QuL5gTp0TEU2SrpM3Xw
	J1qCvOhw8+232cci8UeHeiXzj8+51MLY1/sPUCJYabmEOPnhjL9aus85Hoi4jO/PCyFPErhnBTH
	4f3C40NL3syDNb1PAObKJEgC7KPRBeGlt5j+6jaIJGHGfZ6tZb27clzw==
X-Gm-Gg: AYBFou2qJ3x4FxiBd2z4xMsi7tuGSgbe0iIx3+3Al21aeYWwHkLPd+Msv5eSDNjeNBW
	UoyI0yy1rpnPqb2VmtXK2f1XkYC7bF88DV3RQtRV5lPJL959MS8AKoj+OgZwdjXhh3KXrT3O2pg
	VSTFAQLrElRyGwgXygdFfrTd0STPkEhL5KPwDD1I/6k4U40XdIqosGCAY7w6u6cnliORwNWkbnJ
	5qvQLqNv2CeEl7h2glwVTiy/rvFnABYNP9NE4JEfIh7y6joeof/392HTHuJjB2DLdnLY0NxUM0b
	WUCGb+DBXkWCiZX8hn0J7XVD3RJAPP5jY3MLCafiuLHyNQ7l7IDUB0ftqD9NcJgsTxK6NT3hny7
	2TGCcp+lt0FjGBZp6tBG4kpF28R+SSMQbLlHTGWLfm+uo5ZSHK8ZY72NlCA==
X-Received: by 2002:a05:6000:1801:b0:485:8226:c698 with SMTP id ffacd0b85a97d-486e0f8565fmr3043553f8f.23.1789039000704;
        Thu, 10 Sep 2026 04:16:40 -0700 (PDT)
X-Received: by 2002:a05:6000:1801:b0:485:8226:c698 with SMTP id ffacd0b85a97d-486e0f8565fmr3043528f8f.23.1789039000339;
        Thu, 10 Sep 2026 04:16:40 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm34310512f8f.0.2026.09.10.04.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:16:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: sashiko-reviews@lists.linux.dev, Amit Barzilai <amit.barzilai22@gmail.com>
Cc: dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: display: Add Solomon SSD1351 OLED
 controller
In-Reply-To: <20260823112814.896AE1F000E9@smtp.kernel.org>
References: <20260823111959.17029-1-amit.barzilai22@gmail.com>
 <20260823111959.17029-2-amit.barzilai22@gmail.com>
 <20260823112814.896AE1F000E9@smtp.kernel.org>
Date: Thu, 10 Sep 2026 13:16:38 +0200
Message-ID: <8733vhmk4p.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9t0yCaXgisYYcFsC5sUtjHD2vUJhRwHh3vm-TnFPUPg_1789039001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

>> +allOf:
>> +  - $ref: solomon,ssd-common.yaml#
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - solomon,ssd1351
>
> [Severity: Low]
> Should this properties block also declare default values for solomon,widt=
h
> and solomon,height?
>
> Other bindings that include solomon,ssd-common.yaml, such as
> solomon,ssd133x.yaml, establish default geometry values for their specifi=
c
> compatible strings in this block. Without these default values, device tr=
ees
> that omit the width and height properties will lack a schema-defined defa=
ult
> geometry.
>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260823111959.17=
029-1-amit.barzilai22@gmail.com?part=3D1
>

I think Sashiko is correct here. Let's include the default values in the
DT binding schema to be consistent to what is done in the other bindings.

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

