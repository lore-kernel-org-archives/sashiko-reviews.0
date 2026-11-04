Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.192
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833072;
	b=wRmQSK3w2luttVTqaCx2ShpytFRqg/wdkALWmnw+htCwFqU+ph0VMTEzjq02rNJuUMoZ
	 1H/vsniGsYdRLNooWz9QHntpTbV7dSt9JRy8f/j1ztsVBCexaagAJL0/0oR0ZU7ZtHhsn
	 j4PzAlLPt51R+fdapvimmPfjA/Kt8XwPRaU0z/h6jPxPe5aV4gCzkP6Qi3ECI99M+cR3K
	 RctdwU8cz+nbcBG2LFUrLBLAvDqOc7x2q/sBH19onFI9ef1bE2zRCjvpcwdCQa1rvajRQ
	 WW0PBBfigcD8mp/Z2Kw+aLQ7QolJBDneZVZMARscbJwVsyExYcGnvjZtc5Tm439qBVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
	b=uzHwO3g8KLfCXfnVaDOpgvVChTqzo5uBIernxkgazhsV7f7PDRz9HHB0gbrx2EZOx6tP
	 grlIWvg4TbKRaVZbbZKkdmQ8/IFOxzm97BVjXxanB1f1fbqKm4rrF8OlqfXNFd9J2LjNL
	 O69GsebpyFRxIhO9RRoLKMArfj8EUa8F6TYk5QTjb/DMWd0X4WkWL0MjojZ5I6fj3zVjZ
	 iO+T+Gl5GLvulU7huhcp/s2tuVD51r02AXsGIXM07UGV0MFMxkJCCHMYB3EK1YxQv4rn3
	 SAimw9bM6K2LVUIFu6vtS6yXzEARF2m0wqykBFd6TSguhh8W0MEVAt4+PcToqvsJwMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0rNEEQOZ;
	arc=none smtp.remote-ip=74.125.230.192
Received: from mail-qk2-f0.google.com (mail-qk2-f0.google.com [74.125.230.192])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8452B606A32C
	for <sashiko-reviews@lists.linux.dev>; Wed,  4 Nov 2026 22:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8452B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0rNEEQOZ
Received: by mail-qk2-f0.google.com with SMTP id af79cd13be357-93f184dad7aso114177685a.0
        for <sashiko-reviews@lists.linux.dev>; Wed, 04 Nov 2026 14:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833071; x=1794437871; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
        b=0rNEEQOZl42rWAzmDxW/Hc0BJQ6wwsVA3cpkcpebfwuDaQSnL1VY9nkGUh/6N6Doh/
         zVPfHqml2F/T8Lx3QKl3MzRXmtiTiE8ejxgBP4Tqye0xfavNrYezzpuvRq2bLIw0eUo6
         r8IlnSoPRII3/6osap6eS9w7u2G8MrbbBex0KxKYIhvVqHgComp0fHwiYjCKGBunWA5W
         AH6uzKFBlVRcddWHkEJI3Q2604CQDorAl+IKr2adLYdmlhoXa88nuUxuFV5Les2DCTtF
         AzN6qBdR2SbUmAUsw9udmVK/wcK9soGPRtty4ozgQmOz32P3EDq4ITN5UlMyMnaiNlJH
         6lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833071; x=1794437871;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LfE6XYGuOtutQi6QIVbHin4gqCciGQW2WLAtGNmvG6Q=;
        b=CL03CK5eaJ040p5GdtEaeiK4EwPeWBEQNiCLPMHd5cntkPxNiBSmLnXrPBKiWRDPZg
         S1bchtvE0kNzd9GKscLqDci+oLe5Y52UBAHVdneLWJKtO/XsNXPdE3F8XXqs10i63aqZ
         fxvs4x6xS4Yhqbwit86odR9r4+Vvm3azw+axHDRQmshyP1VPbEhW36zs4QcgDVbEhc87
         9O0VcIvXyaUFPNGI0ThIKNCAJda1/uzMP2hZj51rgSm/RssvwV/3K4XEL93Jdp0EcxMp
         R1lhJgpSgmS660MxyDaof0rM3lZS5RqAWNAo4EnUkONM2SdOzoq2KISyzyUYkBV4cCee
         pYaw==
X-Gm-Message-State: APuU4Z9yUJQ+0yan7qlq39votHpFP0p9PmqkNH328b0OMskkWeyuTFVj
	DOJ9D0vGBkk/vz+F9XVLUnQd+qpqqNXuDHF2ZQJwzNGI+ZTgjwuDywZ+AtYmBtgr9XI=
X-Gm-Gg: AYBFou0r8fRqlS7o7hacYKS9FcEgQTO0e89TTMIPSMFW0TEEOzT0IVc3YznCQPCidQw
	vmv+ZLJBlLbowzGQqnsYwvRg0o4tLkvVAd3MCrIvanz3kD26Ptc2K34NkJhEGpm3Kmk1A9P6mF1
	315kO6ik3TFo+rbeOuc+0dChRQ5h3FFkT7BP6sA+EThRoIpmLoBIO3j2sdEm/qJx9YSCKnz02Af
	tMhYn3dXcDg5je07FFAO5avDGBF/2BQsBnI2LKr0C4o5Y9laOECNhac1WXPa618MNg3Ut2JgmV6
	irsp0su/mHa58UzTKwltKyjunWdSQ2dYReAKrjDOgz7vCRmCHAcE+HJDQ3GD17DeOXCIPW6DztV
	/O6tDZPDPMdDx1u+V8G8HI4oCIOUyAH3WRNURc4lFbMR3+kaHULJ3CTxAB8Js8BJe/VWPX3+Uuo
	QVzgAKyLnW5jjlT9hpMtN5naSBPWa8RX5NhHzrcGvY9574Qb8Qnvi0afQSPoOGCzBR5EiCz7uF/
	5ttDo38v/PW3859AxdNoAzMd37ELiXn21SRcjqBOFo/6brJwV6wuF2zBMk5CQjssAT+zU+vTaIb
	/WCeIqq0+ecJQYDB1G/D89oNCBd92seHfPg=
X-Received: by 2002:a05:620a:800d:b0:93f:3219:835f with SMTP id af79cd13be357-94421841ad6mr3045912085a.81.1793833071469;
        Wed, 04 Nov 2026 14:57:51 -0800 (PST)
Received: from [10.0.0.48] ([71.69.222.122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945d483d762sm318573385a.27.2026.11.04.14.57.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:57:51 -0800 (PST)
Message-ID: <79ebb791-f118-40f3-8f6b-9549dff481ba@gmail.com>
Date: Wed, 4 Nov 2026 17:57:49 -0500
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 4/6] tls: update the RX key when a KeyUpdate
 is received
To: sashiko-reviews@lists.linux.dev
Cc: linux-nvme@lists.infradead.org
References: <20261103-keyupdate-rfc-v5-0-de1ab90a88d5@gmail.com>
 <20261103-keyupdate-rfc-v5-4-de1ab90a88d5@gmail.com>
 <sashiko-outbox-198140@kernel.org>
Content-Language: en-US
From: Martin Belanger <martin.nvme.dev@gmail.com>
In-Reply-To: <sashiko-outbox-198140@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/4/26 16:43, sashiko-bot@kernel.org wrote:
 > > +   memcpy(crypto_info_salt(info, cipher_desc), iv, cipher_desc->salt);
 > > +   memcpy(crypto_info_iv(info, cipher_desc), iv + cipher_desc->salt,
 > > +          cipher_desc->iv);
 >
 > [Severity: High]
 > Won't these memcpy() calls trigger a CONFIG_FORTIFY_SOURCE field-spanning
 > write warning when tls_check_pending_rekey() -> tls_keyupdate_rx() ->
 > tls_keyupdate_rekey() runs on a socket with a registered traffic secret?

I could not reproduce this. I built with CONFIG_FORTIFY_SOURCE=y and
GCC 15.2 and ran the keyupdate selftest with TLS 1.3 AES-GCM. There
was no warning. In this build, __member_size() and __struct_size() of
both destinations are unknown (-1), so the field check is not compiled
in.

The result depends on the compiler. A small user space copy of this
pattern gives a member size of 0 with GCC. In the next version I will
take the info pointer from the union itself, as c43c1c24f3cd does for
the same reason.

Martin
