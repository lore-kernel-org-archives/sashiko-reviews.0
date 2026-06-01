Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21398312825
	for <sashiko-reviews@lists.linux.dev>; Mon,  1 Jun 2026 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780310507; cv=none; b=DQQv4nhwjBZZlSnXc5iv8S5+iOUuei6NXXFn99Kz7k0EHuJsF9NuzCKT+1cNM2Qfg8N3LoU8B8OnXX0wZLC85q0sAoP71OvLf2m+cNXOZOPIJa6agmPeGDNa2i08yFFRwiU0CqQFR1LTEk09DmtgpUwVCcLlgpXkJiWTp8H32is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780310507; c=relaxed/simple;
	bh=s+c0xM8+gvtFUA5waeSL8CyP5smDxMDZTJGiCFyuu+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=meRGUPdgFsxIc0N8UxLAMQewj4jBADHSR6nbMy7o4UysxhSQhCmZ1ItHa3jU1YYkPHlzVwmJR6qi+X65G+pFHMSFD5Vr/jznxskwlaninYZElOYYhw0mN62atxVnr5RM50QB8tpw8c6Hz554YtL7mT6dGmLxMCmmsdYSDVsEWGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bymmPY0O; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bymmPY0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780310503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eJeaJGvB8Mvl8AxiXOwr4lw9nL4JUXUEE6pr5CDoFrU=;
	b=bymmPY0OLOyrGCqSdtNdJlXFDJEKYqH0Dylk1uTduu/bynYSdkRxcCg87kYRjpJoeT4Sti
	1x0gvYukpsH9uoDQOZ12oXU1Q9SDtxZIb4uQ1dA4V0SN/emp7UhPlKspvAJ+XyW4rXrnKE
	DRz7RVPYngbNOyiVw0/z/Ztta2sWL28=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-536-i5mBeevbNr2ppwifH-4CUA-1; Mon, 01 Jun 2026 06:41:41 -0400
X-MC-Unique: i5mBeevbNr2ppwifH-4CUA-1
X-Mimecast-MFC-AGG-ID: i5mBeevbNr2ppwifH-4CUA_1780310501
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490a763180bso11272475e9.0
        for <sashiko-reviews@lists.linux.dev>; Mon, 01 Jun 2026 03:41:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780310500; x=1780915300;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eJeaJGvB8Mvl8AxiXOwr4lw9nL4JUXUEE6pr5CDoFrU=;
        b=WsSgvAUXpy+BErhKT9o1feBzqqz3XtQVxTR4ujryn8llDH/b6F1nZ6DGNmTbeVWj5+
         V3VUzILO67UhLPNhd0lOENEIUCa/obtkpcmM2xzuEEurW0HIeqRg6YamJFEqKHP0snNb
         CHJ1lv7bRTxiGLjKLX789fEA5DIh3n6u0ebJ1dBA8HedmuLRmR/jxW1q+AbEtuHHKviL
         fJwReutEv/Gdob2xgm96B3dh34X29RMrxFWSCnbIXE7A/G4X6B0lCs62++8bPaGYTVDz
         ZBC/2YshwK75C/FaD/7fXfe7GnLsMbwtADqqD5EBV0DZVdkQFvA+/o4c83eVi2A/cKPS
         O+2w==
X-Forwarded-Encrypted: i=1; AFNElJ8Pmem0jwxN+TlrDAd0V6ZYaJWLXsar76T6PfD61ErCVAQKEOg3ofjGSOGW8iAynztX8d03Cm0MMm79g4hQhPY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy92jFlh0/LtRDNwFHXfjSSBALXcPK097S+6WQqN2Ky0bcO+/rB
	qWtRjJTcjNH1IKk9vrOAFtbHeDGOhNQ+tZr4zZN0aeZZ/wx5syw4KIyNscv3jTMwfAMMh3uwKZP
	jwKBP8Le+Fw3F4FZYoqO12HKQOnqOZ792QTwJhAlKWf6Fj6pPesF/mdmQha1M3S4egblUkw==
X-Gm-Gg: Acq92OHRrln3yfhh5KPZZCHavwVYiylm98Fq2FksqrZ1OU69LAu/lfZCra3duMd+/4r
	HXdTcxoEsYFdntBYyzZ5ai7IABcmuLXJMx+ZLb6+8L9yUSs7MTXyd7CnQpeH//+P68tEPnqp6d1
	QIm6q6O6n7GkvfM1yEZwLtgf7xX7n+cIA+PVLcqVk7HbbW9U8B8DzxtAd/cC7Jr+mkGwYvxQ8ZP
	nxkJyVfKFso84jOsdELAb9IDhr+0HJh/Lj7qy0IYAWTg2egxwNh4bqnkAipDQs9GOgg1WSPV6Gu
	Uy/90YN98AkXnfCQ8rC62iE8Eu4Z6aJF/ycx9Iri9RM2cXUi1kP/JBvfUI2lL4IhdjtNtGYTvRP
	20mO7PgNxtLGXEv2SxSNAnfBUmjRdMRfdXOFcSzKpDxDJinnbAYaRYx3Mxb7fACSRFkko
X-Received: by 2002:a05:600c:4fc7:b0:48f:e230:2a1d with SMTP id 5b1f17b1804b1-490a295d5ebmr189424265e9.32.1780310500579;
        Mon, 01 Jun 2026 03:41:40 -0700 (PDT)
X-Received: by 2002:a05:600c:4fc7:b0:48f:e230:2a1d with SMTP id 5b1f17b1804b1-490a295d5ebmr189423955e9.32.1780310500125;
        Mon, 01 Jun 2026 03:41:40 -0700 (PDT)
Received: from [192.168.88.32] ([169.155.232.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34c3081sm24553503f8f.15.2026.06.01.03.41.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 03:41:39 -0700 (PDT)
Message-ID: <69dfe2a0-ce0f-4a92-98b5-c4cefd30ce49@redhat.com>
Date: Mon, 1 Jun 2026 12:41:38 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 5/5] net: dsa: ks8995: Delete surplus driver
To: Linus Walleij <linusw@kernel.org>, sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
References: <20260526-ks8995-to-ksz8-v3-5-c530f651989f@kernel.org>
 <20260530004902.BCC381F00898@smtp.kernel.org>
 <CAD++jLmZoGh+o5YKfjoUCWhwiRaO+Lm-9DFUdUzd9KpydWK27g@mail.gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAD++jLmZoGh+o5YKfjoUCWhwiRaO+Lm-9DFUdUzd9KpydWK27g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GDBjOw_NDWZMwp4K_wEd0d1BugVuMve-0LiR0M1vfO4_1780310501
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/1/26 10:09 AM, Linus Walleij wrote:
> On Sat, May 30, 2026 at 2:49 AM <sashiko-bot@kernel.org> wrote:
> 
>> - [Medium] Silent loss of switch driver functionality on kernel upgrade due to missing Kconfig migration.
> 
> No-one cares.

Uhm... I have quite mixed opinion WRT to the above points as try to
avoid breaking users in any way. I'd love to ear a 2nd opinion from the
DSA crew.

Thanks,

Paolo

