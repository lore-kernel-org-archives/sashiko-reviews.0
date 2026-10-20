Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514187;
	b=hrhkaAeWhGNSqkcrnE964RNE6/l+dz0KYiV1NPp3kxXFX7krFKB/dmRyeMG2vxbplHKM
	 avZl+NyyDNrBJ5XxOmx8BeNLWOomYo1HL2VJOCn4s88sHT/uV7Z/8ch6i4Fypz/FZwLu8
	 E6k05/XrA/bnKZrLmh7/R0m3/9lpCJoUhFXfubG6S0hJDeLZiZDTSggu6Q6IyK7ew9fIb
	 DtP6Wn8VBTVn9IKNb9Hj9OMVa4kNq0JnGLt/7oxqPv/6WRUJ3rqNgUcmdAh0eXIIydhrI
	 7QnQg2+pF/9jD7uYGmM0gkF1QHAxPho5eOktcXjM0SdwutSUOr6sUP/WS1aZsMsm0RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514187;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:User-Agent:
	 MIME-Version:Content-Type;
	bh=6Q1DJyEaZe++yNpSqDw+OavmshV1yeIIQUZ3xTxlW58=;
	b=KpnCr4Kq7oTZqhJV1y9gVyc1rM7LixQDZ65K+ap3Gv1UHXe5310HXxZtCGi7ZOp5P51h
	 1Y+j5W2wvELKUasKV3qlr4glqsoxTUVb2K/NQ8nFBFQfd4NQbinCKf7GByR8SGHIrD/Cn
	 WyX54LG/25FIwWsas2aukfSSbk79Rk0ODFgBXXN9czxa3W2e9X7lsLurBwQdR/yZmfA1N
	 vS7e8v9AQsoFwLIainsD/mVov+is3TGw3zBnesvoK6y9b2b9ptpw9qVOs7QbY1RF7n+dY
	 K4khsiOWgXhacv5x3toKZLfjzS1iwwQUXf1s8c3iQofBXniKBZnKqYtj4gqzNDkeyDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=beagleboard.org;
	spf=fail smtp.mailfrom=beagleboard.org;
	dkim=pass header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=UbLjXr4n;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDAA606A31A
	for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 16:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BDAA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=beagleboard.org header.i=@beagleboard.org header.a=rsa-sha256 header.s=google header.b=UbLjXr4n
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-16079d54c17so734493c88.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 20 Oct 2026 09:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1792514186; x=1793118986; darn=lists.linux.dev;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6Q1DJyEaZe++yNpSqDw+OavmshV1yeIIQUZ3xTxlW58=;
        b=UbLjXr4nNmS4lDZWtoSGNI/OWpyjdO6/9ZcjS5QLyFFrAl8ZKd5MOvZt/fxyBax+U1
         ++hp/q72saeDi79jRa02lIqwV7+MOxZXBeIRTxsiFo3yG/bYTJAyXGaRCL27pziVkF9M
         oUfDwXdu0IUCMCLk/kBFVb5jT9ohiyYUhwTjMoSJfeNNap7WNLTW3kR4GphJsYyTrBpG
         bV8E/autOcd8xnSYXwpPARCUG1VR8ewpayCk66YUaAAKjANe9aYiDS0BLWeJxntwLEAM
         DefqwbbfEUmMDLLIi98tK09/8fEYn/femebFq++L2+Fl3PBta2U5Quu1j5aQaC7cb5nZ
         fW1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514186; x=1793118986;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6Q1DJyEaZe++yNpSqDw+OavmshV1yeIIQUZ3xTxlW58=;
        b=U+k7EC/P0G3VoYR3/h4H6A8dE39vweARoREihzBYPR64LWZNCsXSIYKWUfnsMjxPqe
         1m71ok1aqw0DiwV0vswd/T0INKE8/EIdZKPKDOt+oCi1lM/Bs2RNpRPHrD/GT4POQQJA
         wAgBIWV16E19q9ysBPAyVHueJLvMrmnikcbBclqTH/YK/NmtRAyc1yOqzsnaldDxo7UM
         Z36jCsYg1aKxDls9CqevXt51f8C7XENgS0x4ziET4YIKlJE+2wzJ3mnbAElqbp7JheeT
         Q+L5KtxlfvU3F2SRRH/+ARbTgVjZHqFFFJJp7knnWqLUelixTy5HtRRvS0JYdQmqPwML
         19jA==
X-Forwarded-Encrypted: i=1; AKwUvByKjQK3OG2U9V+1rAdv/GWpT/QtXIrPWvYthJLa8yWA4+DpeQpFIkaTMnaSZtWHR6uB2hYd/AwBa8XQ7uUyEq4=@lists.linux.dev
X-Gm-Message-State: AFq9FYLdkgX+sCOPDmAu55jYpe7fAmwu6jfOrViHZGO7O3ieWIuQb4rj
	lOGshMLas0IkP8GtiT6OnM7ZQ+MuMYg4ZE0AnRbxSZHEesluE9SFbd0Se2nHr765P8yZhT5xhN1
	YqTo=
X-Gm-Gg: AYBFou33ww+ee5KYqFt26mU11JXvWBVSL9TxVi9iQKEWmO0/rkBNfs+LNrqogJQrZvu
	oB4neLYQbgUVlpRdUVgqvHw1JXvKXuNpVCGEZAuk5Hh/fn5A5MsPTBpTJbD5wyzOQAZx9PJFcJc
	Xr9DO1BM5u7ZBNbLl3JcO7Y2zxpnRugBZCvkV9ecQ2oCJ4naq3OLANz9rH/4G/Xyr6gCbPEyL1Y
	mCu3Ib2j78/iyh0ComfJFAwB2QKE/tXoNeCUexDuffuh/apEWh4H4ti+i4JY+gIpjBFk0FQWyeE
	73voFZU3VZt84NGB1e5wgkUXg9WiHPbc689678TR31kdIiz+B243FKITudEbCAryqLlSCLWPp4i
	6GEv/1IPpttt75YDaUWnbdj5HU+3HQwXUgGNy2mDXiNroMDnUqGBUglOCiwA10VJOIVOE14MiTt
	zhYSOLDksKKJo+u5IhVb7iqsqw9e8Qxqunv6tsTGM5Aw0pNfvmKYb7VTZW0DxQCgMtX8Zp5Taq
X-Received: by 2002:a05:701b:4308:b0:15a:2b63:a0cb with SMTP id a92af1059eb24-18511ad8bacmr17230352c88.13.1792514186222;
        Tue, 20 Oct 2026 09:36:26 -0700 (PDT)
Received: from fedorapc ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-185aaea8b24sm30859768c88.19.2026.10.20.09.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:36:25 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
To: sashiko-bot@kernel.org
Cc: "Ayush Singh" <ayush@beagleboard.org>,  sashiko-reviews@lists.linux.dev,
  devicetree@vger.kernel.org,  robh@kernel.org,  conor+dt@kernel.org,
  ojeda@kernel.org,  gary@garyguo.net
Subject: Re: [PATCH v3 5/7] drivers: greybus: Add software SVC implementation
In-Reply-To: <sashiko-outbox-169773@kernel.org> (sashiko-bot@kernel.org's
	message of "Tue, 13 Oct 2026 13:07:55 +0000")
References: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
	<20261013-gb-uart-transport-v3-5-81d0a8a1acf7@beagleboard.org>
	<sashiko-outbox-169773@kernel.org>
Date: Tue, 20 Oct 2026 22:06:19 +0530
Message-ID: <87a4o8uy64.fsf@beagleboard.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

sashiko-bot@kernel.org writes:

> [ ... ]
>
>> +    fn send_request<P: AsBytes>(&self, hd: &hd::Device, ty: u8, payload: P) -> Result<()> {
>> +        let msg = Msg::request(self.new_operation_id()?, ty, payload);
>> +        hd.data_rcvd(protocols::GB_SVC_CPORT_ID, msg.as_bytes());
>> +        Ok(())
>> +    }
>
> [Severity: Medium]
> Is there a mechanism to prevent operation_id leaks if the core drops SVC
> requests?
>
> When gb_softsvc sends a request via hd.data_rcvd(), the greybus core might
> drop the request early (for instance, if the GFP_ATOMIC memory allocation
> fails in gb_operation_create_incoming() or gb_operation_get_active() fails
> in gb_connection_recv_request() in drivers/greybus/operation.c).
>
> If the core silently drops the message without calling
> gb_operation_request_handle() or sending a response back to the SVC,
> could the svc_operation_id IdPool leak IDs until find_unused_id() fails
> with EOVERFLOW, preventing the soft SVC from sending further requests?

Well, if this could somehow happen, that would be a bug in greybus core
and should be fixed. I will look into it, but I feel like a kernel module
should be able to trust the kernel itself.

Best Regards,
Ayush Singh

-- 
BeagleBoard.org Foundation
https://www.beagleboard.org
