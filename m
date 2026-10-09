Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC193C3F52
	for <sashiko-reviews@lists.linux.dev>; Fri,  9 Oct 2026 18:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572283; cv=none; b=oaqXJ2m3xtFMGk0mDC5dsodBcAG/u89M9IzY1H0yfi9t5CbdcNQz/ueBrb2/9Ra0ah24Lgiq8ONWE32p3t6HKqGDPUVt4moQZARcWBnbOUJFUkpwDNnLkIyWOXEtvzZfHOWzPRL53KjasGHoZMsNDJFD7os5T8K02/M6/iVA928=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572283; c=relaxed/simple;
	bh=CImErCK453/2jtS/jVyzggFVcO9aeFsBNs1Imd7DWps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h4NhAt2WAEF8LO2oo2V+ui7UPD40RaVJd/GPBpgxDtkhZLC94hgFt9bjOK+LOXjKR7JofdFYPZhj3qxFs9jem3Awr+gsuMp3OZSYhZXxyVpa74lR0B0D13trswwQt6OG4tspUTrCPuZJol63ocXJSvNdZOScJ7QMz4Nr0DBPHsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ri/pffol; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ri/pffol"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3a4b9732d5aso4006976a91.3
        for <sashiko-reviews@lists.linux.dev>; Fri, 09 Oct 2026 11:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791572281; x=1792177081; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voQnsCMf54BeM6EKGprlzbES0+jYHxFzIpzAIjrxSoc=;
        b=Ri/pffola/M0j/yXH+Hy4lfgOOoFfpuUuMKtWklFlbAoQGnLeggX3Irmq+A8F7HwYK
         BESjx5fuSOn17mILL0/d/S3D1pBCNYH9RBCGUeFy66mKI8za1oU6CRiPdb888A1hNQZM
         MaOXLEaWAc/ZCZnAWFchNfD/qlpafPYqvb3o5Dc0cJcjDGBDc5xMZ/kyeggX74vncadK
         yr3Cb1TZpA8TnFiBA6lTJr34OOVGbVH+zYpgqwk3lWUbQejjLAlbKFajZdmLntjF4OMr
         y72aRNIKjjGd6G35uLFurMTVsqWhfocADWEjYZALyZV2fDnv9wWh1zVvAFqvL4tuY+By
         XDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791572281; x=1792177081;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voQnsCMf54BeM6EKGprlzbES0+jYHxFzIpzAIjrxSoc=;
        b=GSev4YxwsLmeBi09qIipgRYKCgD5OkZCzG+fY8ZbmOs0/jzzieIVrm6akJBz7US5Ya
         +bKZUMtqFpX6U7MQK0V1vfm9Y0A3OCtMaAxviNNUFxhdA2qH/xY3Ad4gOO5ohh+HQBJU
         zVe+3HGKu1u0krT0SZ7OWGvPeb3shygut0laAEJoey2ww/5cmHpsgyZVPEoRc+TMUliC
         bJlxto65zKpLLc/n/l2am7u79Q4p8QEmUs6Rsikn5JQgSYr2ROdx0K9rYM5APmLHxjqF
         QR3+eZypex5ae17g0F22DOOyUbx1uTqSMNuMCjzWMKPqVk4llMTo786/8z1m5yNTFKgz
         czZg==
X-Gm-Message-State: AFq9FYIoZv+226rU7FuLE9kgu5je9zc9mKNpRy4rQxVyokyMPfIpjJwX
	Kjk2UPsOIG04+Gz/axT8wFhspG9bw2pNhnRpkR9ycQtHOu2aYXT7e/BxoI8z8LFnSqVLGl3/4NE
	StTnTqEZs
X-Gm-Gg: AYBFou0wAj01E5dZo7qmb+akcPQ5kKGXBmmIUblaptMWx1W348jayyYCr1YBNqeAaz9
	i2ke5KYy+dnRs8R+5DV0sz9SLNsJ/HpUre03sOi2/KiLj8i0A3iW12SRnE+VNZsFu6GouumZDTb
	c9OgqjqCiehFrzywfqFu6vp6mOob/+QiczDVHzOHTtLmMmRjhRPHUNS5OT64fBR4U+nDOSb1MbY
	YBds6xL1zkHm+OSrOmbyLoFZ6RGgNNO+IeNNhkeH++y4ULAUZ97svMTOtObwUwK+TFDhYYIB6IX
	ObnMvfGVvOJYZE7pDBTbhSAlVRw9fKdCkt3balDzdQUltq+A3jcOpz4Or0ZgJed6+HTx2uFP4nr
	VslqZpbvi2aDmu9NGNAXKnAFv6Ud/wSU3atJAs+QN1LJ3N97vPApVekqaXjQAxdz9ye5wshOI19
	b0qmsPgXS6hMWuN3OV4ReBajXUOL8RaRN7+ardINWuk4cMzXxKV1IVGDT92zC6BIak29lFsEF2a
	pgZwTJhpqoCcXS36Cbb+mxQN5kohjTqzqlg4WZDspi9hn51MKLogpo0QOjP2GnnnnTwk8HlKydb
	48mOtK6v13iaHJ6zihN60T7wOGmHZVB9+963GNyK
X-Received: by 2002:a17:90b:5887:b0:3a4:a383:f9cf with SMTP id 98e67ed59e1d1-3ab3a9a78f8mr3010368a91.38.1791572281011;
        Fri, 09 Oct 2026 11:58:01 -0700 (PDT)
Received: from ?IPV6:2a00:79e0:2e7c:8:3cac:e69a:a0e2:88af? ([2a00:79e0:2e7c:8:3cac:e69a:a0e2:88af])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed040dsm5852181a91.6.2026.10.09.11.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 11:58:00 -0700 (PDT)
Message-ID: <9046b5d6-ca6b-4466-bd8f-73f034234caf@google.com>
Date: Fri, 9 Oct 2026 11:57:57 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: connector: Add time property for
 tSenderResponse
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
References: <20261004-tcpm-sender-response-time-v1-0-3f8b43084acc@google.com>
 <20261004-tcpm-sender-response-time-v1-1-3f8b43084acc@google.com>
 <20261004030531.9D32A1F0089B@smtp.kernel.org>
Content-Language: en-US
From: Amit Sunil Dhamne <amitsd@google.com>
In-Reply-To: <20261004030531.9D32A1F0089B@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 10/3/26 8:05 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Low] dt-bindings: missing schema constraints for sender-response-time-ms
> --
> 
> commit eb9d81bbfb13df2dbe09db76aefbc40c815abe01
> Author: Amit Sunil Dhamne <amitsd@google.com>
> 
> dt-bindings: connector: Add time property for tSenderResponse
> 
> Add the sender-response-time-ms property to allow platforms to specify
> the tSenderResponse timer value, i.e. the max time a port waits for the
> port partner to respond to a message that requires a response.
> 
>> diff --git a/Documentation/devicetree/bindings/connector/usb-connector.yaml b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> index 8ca0292490a2c..52dbdd738db64 100644
>> --- a/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> +++ b/Documentation/devicetree/bindings/connector/usb-connector.yaml
>> @@ -283,6 +283,15 @@ properties:
>>       maximum: 200
>>       default: 200
>>   
>> +  sender-response-time-ms:
>> +    description: Represents the max time in ms that a Type-C port waits for
> 
> [Severity: Low]
> Is this new property missing minimum, maximum, or default constraints?
I could add the min, max & default for this property. Will send a v2.

Thanks,
Amit

> 
> Unlike other timers in this schema (such as sink-wait-cap-time-ms), the lack
> of boundaries means offline schema validation (dt_binding_check) will silently
> accept arbitrary values. Should this have explicit numerical limits to prevent
> accidentally violating USB PD timing requirements?
> 
>> +      the port partner to respond to a message that requires a response. This
>> +      timer starts when the port's PHY layer receives the last bit of the
>> +      GoodCRC EOP corresponding to the message requiring a response. This timer
>> +      stops when the last bit of the EOP of the expected response message is
>> +      received by the PHY layer. A timeout leads to a soft or hard reset by the
>> +      port.
>> +
> 

