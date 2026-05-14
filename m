Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669CB3AEF34
	for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 20:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778792327; cv=none; b=iQumeUlK6e6jhZCeW5s3JdwBgL35wOezeOK9tJG+roM6+rxLazZAc+9nE+PzZ2j8Zpig9EJ5jJlcp9Gqzahh3QEldEm/I6kZEDoSCTISZ6oas+E1knnCfA4mRsjK4FqO0H+ZE+myGPTPG6xqIhojG2wTSy5mCw9aVZ9qLlJ1yYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778792327; c=relaxed/simple;
	bh=zKiIWcZodX4k/LMu479yY2TQAIj4tGk4ug8P25zXyBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KpA9OMQR9rrWVFrRr2/7lhhpYzxJ/K3r85Fyq09T2h4JYoeGL6lk8lcamwpmWzrg150Xwo8uy62rVuvkRFCbwtJ/nyz8XpNJi5mwma5IH7B9kg0HN6HWz5kB0+Hg9u+50iR53zQrjgxK98cTGO8uDyqSDLu9sFIr1UhygLyRREM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oe6qgOq/; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oe6qgOq/"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b4520f6b32so13995741eec.0
        for <sashiko-reviews@lists.linux.dev>; Thu, 14 May 2026 13:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778792325; x=1779397125; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xbz4lt4OHMSKpnmgA3s6hklA6EIJQ7W2N6JkysWUJ2M=;
        b=Oe6qgOq/FNBXUcPP3IgGrUZZt8kpqJCsVn4XROVSCN1lKC4NFJv63BLGYjEZH7kdk/
         e9TcNagnPWOC6JVMpuWUg6CLHL4nsCSjG7jjs31FZx7Wwi9cg8e03tKuaMYFbyGcWUqk
         6iu1MOcmAP8gr4gFAPFHU5y+IfAzyRvpQYn6lqsIIhSPnP3XuZU2/09Rb9Zp3TWO5sVn
         iQW1oxa+JTXYXpyTB9oC89f9rB2ubeWaNs39EpD5kjEKrlXpXz7EiSXYFyCpsRPTfu6M
         ef9KmC0TXibICapXhU7/BUrKvGAEgpqhEQqn6uQWt9iQgcnUK5nxbEjsxeXnP5K5n5cZ
         bgbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778792325; x=1779397125;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbz4lt4OHMSKpnmgA3s6hklA6EIJQ7W2N6JkysWUJ2M=;
        b=IrrB2hr5x8BL+MBeZfLWPLRh4ngpeMjF0AjyPedhqNkUWmQRmaduxIjIhKE6eRfXRw
         QGJ4los9NLTi+7nJAk7/nRbTTz0HzPiqFMpZItHZNACEerJ1JE+eTogsePWlhuKW/IAE
         YMI16gWfXbuEN9TcDVrr5Ih7pA8myW8zur419llOYtYnMSomodKSgD1k5C5HdNYAFWDv
         4JFrwxMBvqNL4BlmwEoSrXqA3KLgR4MIJ/EHaXru4+0PBCvDFDe98TYHoDKbGHdokHXP
         BW4DsbIKMP/mNQVNRs+SLfbxepyoUUkpfG5iXnCtnx19I+mQQ83zXZeFvVf0Ww8t7DhR
         KbGg==
X-Gm-Message-State: AOJu0YwtB1eG7uDaak0s2Y3gslrpn6Pwkglk+C6pWTDdE6ZsUqnBJ3x2
	jkCzYpEn6lRL77ENoXP17ykQNwcmNwHKkkWM2NJ6yxnhSZjlB9KzWe/9
X-Gm-Gg: Acq92OFxHdMhe4q5WA23Q7hNTzye9YQ4w4HoZ2Zh/DFftWaMMzBED2e56sLoSvhJpOA
	Ckq0I6ei2vvsoiZvkHZgmnZMCFItiu3WEKEA0u0HG90M8iyM61JUWH0lhS8yiyL33A6iusglwIP
	7g/QsREHPnfQfKSxsnGWB05o5/wSMSqzgmMfaBZaJz63ei4bNTQn4jWlBWYd/rKfliW3UB+CMqz
	bugIvmEesiAOF/hOLnC+upUg5ZvH6aq/iFXXBoWJH492D2cJw7b7IGWFs91RFiGYmBJq6ZXYxAi
	zeDIzdmlrjtStCHyZ0ey7+TrAQa1Q6ZmWlGEFuGv9rbC4Q4WpqPZr149PFYOxL1JgG/DWEYJSow
	lcrjQRtMW8J7sJbDPPcz9roQiPvOGc49epH2GxRywMwpsQQXsOWgGy676zQ0dK30DPwpRnF41O7
	hkMxhs+39/RZaJGroXQRMQHmtjVnxf6PWlKXWX6bzJeU21x4Q5ilE2kNVoMEY6LxAZg5gSygQWB
	/yFjBE3kdE=
X-Received: by 2002:a05:7301:19a5:b0:302:56fe:46fc with SMTP id 5a478bee46e88-3039816a844mr586117eec.13.1778792325356;
        Thu, 14 May 2026 13:58:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302944ffb85sm4493840eec.7.2026.05.14.13.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 13:58:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <12188f7f-ab27-4967-9d74-c8dd81bc5d5f@roeck-us.net>
Date: Thu, 14 May 2026 13:58:43 -0700
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] scsi: mpt3sas: add hwmon support
To: Louis Sautier <sautier.louis@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
References: <20260512214703.655633-3-sautier.louis@gmail.com>
 <20260514010209.5C3ABC19425@smtp.kernel.org>
 <106e2981-35a1-4559-ae20-2026c224f590@gmail.com>
 <388bb990-3df0-4eb4-983d-59c502397b8c@roeck-us.net>
 <agYpHdvQiUtsXeJw@localhost>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <agYpHdvQiUtsXeJw@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/14/26 12:57, Louis Sautier wrote:
> On Wed, 13 May 2026 22:17:26 -0700, Guenter Roeck wrote:
>> If you use a recent kernel, the hwmon subsystem serializes sysfs accesses,
>> so hammering it from multiple threads should not substantially increase
>> the back-end load. If you have 16 readers, 15 of them will wait for the
>> hwmon subsystem lock. All lock contention will happen in the hwmon core.
> 
> Right, I wasn't aware of this mechanism. So the amplification
> path the bot worried about doesn't actually exist?
> 

The bot didn't really claim that multiple hwmon accesses would or could
happen in parallel. Either case, if you want to implement caching in the
driver, please feel free to do so, just don't blame it on lack of
serialization by the hwmon subsystem.

Thanks,
Guenter

