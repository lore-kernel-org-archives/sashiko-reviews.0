Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3CE361651
	for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 14:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781621857; cv=none; b=BKZDqFtQ1CrCQIW1XNruVZis1lS8pj9SVYJrLOnchZWAkTzyPB327V27Wz1o4rAGw44Haso+vZt2ktlUkyoL5Hdb4Vai5NBH9Gt/Mjk4Ca497+Dq4mMfynbXPeQkLrfdW2FKAId8/hYLxwFBTqtu0Ju2nRBhl2OC36sVEbExsnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781621857; c=relaxed/simple;
	bh=VLW9/TMGyN5UPEP8rmOjNnUTBMcUDk592XQ8GQC/dTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9TrYbtvdX2cTMr8tgROsnLWekE+3ogDiZFdPcEqGvzT/Z+o5oQdXks8Gh3mjinEMNZg9Jn5O7uwmDlPCQPgg5qcUEqZNF1UiYum/0a7l2MFSETOOhMfeVeVv+GYXL6Imcd0IOj8/yl/+Z2WCHLSdEtQqjllImGPHwLew4Na3Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKugDFun; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKugDFun"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef616daf6so5336797f8f.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 16 Jun 2026 07:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781621854; x=1782226654; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E7jptHSgz5KByLhlfc5GhmGAlIi/z/XUa5yhD10TU3Y=;
        b=AKugDFunUmx2Mtk0/hpQiIJmnb+KtQtpd+u9JUvTXrTzwgL20kHCwmL1NN8sch9fW0
         UJqGGMPCuWf0kn9QDBpqC4RyH0Zg5UFacoynreLzv8RsvcWhn/XyLAltDyU4Awn60G4Y
         AG5FqX4fe2gN9p2zRQULMAAINBolZmXDqQLF7SPA3JL90/xR6E/H8zdXqQCD3wQzG1bX
         tBqxapOrt/wGa475tpfmkyAkGoFGXfPjqPjRnHkO8PCzhBpVTGP1/hi3ZwXA0o8gU1NQ
         gbO0h5Fk5v0K8ZHcvWZqQSW4vX8+/IQg6eFHAkBzTq7v86Wd2AjORY/uBHGK3mPR83GS
         qttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781621854; x=1782226654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7jptHSgz5KByLhlfc5GhmGAlIi/z/XUa5yhD10TU3Y=;
        b=YiwMxUqSR3ttfiDW3572Yz2e5h7fUxanB2UIgnqZV4ZA+KFjqQ2+f+CEl47fR2T9k1
         tODmR/b8h0+LtKA3PrgWvoMktl69MGhzbwiQmwjmbGZE9OdVNwPyVR4HGlVM8pwFNuA1
         kJBWSf1QyPWBU0rSqmey/t1nCnwziUxUOiGdm0jNLdBQroXvdbyubXpzFTFJtaJ4jToK
         1hcqgevKca6UwS3N0WlIRaHI+jlMzmnekpzroav7pLKTqZ7xUUjIWirHZ+pfvZjiOGHr
         vL1kk8d0obaFmdP288Akmhx088YJaAAE/Rj72fxMElMde750/KWjs3CzJ/kXzupjU0pZ
         5xHg==
X-Gm-Message-State: AOJu0YwDihp4jmsuiMTXgje9R5H0hhfJEX4szun1Bru7tyUaIxnVhbHa
	5oPNealMTEzED8E7z2x5WyFonYf9nEjeAVfnMeuZME1KsGTW0WSXt7SnUgyZvKNKvwM=
X-Gm-Gg: Acq92OF7TMaCeQcaqkt7e6YhMrJ6Ye/mLybAaCkZC2o9pkTFPoBcUtACEIMIHk2UaPO
	ScGRr2NgJSxkf4XmCXGDm8daNzlzLIt110pv8EGhbJKzeQKOUCHfAzEZjtiMDyOiRq0rGePCFvo
	fzscSn84o3aC4K7ZW9cJTRZLS07nNeX6VyPzrRhNwpR/y7rAEBYEGxUgILRRoRIjp3ylWUlhP0I
	24vDOdWMwj9Mm3CUwYvYfCwv14CEAe/GVMzgs5kU1uk7nSKv/Am+e4YfRjofayoBDpWb7IBV+YF
	JEiqyH4HJQUu/Et9ihR7W32z4jOgg1bm3RnJR3uwGKOJsFkIRcBSWwddZZOLYxRcB7268OZluQB
	+zYs+UqX8Q7rJ/0Bdw1b0pts+Q69mKJZzOXbzg7SuWMPQCtNtYdUrdmWVXPFKpvUzjkuCryDW0e
	fgBEmedaFUOEVP7YD49tPmB2NXKbLSf0BPQs6RO0ChT7jpVrtFBq5vmxN2FIqQwoTXqbCcjzNpt
	HmUSgK/69rY6A7JGA==
X-Received: by 2002:a05:6000:41f8:b0:461:f237:ebc2 with SMTP id ffacd0b85a97d-461f237ee93mr1837167f8f.29.1781621853866;
        Tue, 16 Jun 2026 07:57:33 -0700 (PDT)
Received: from [192.168.178.24] (cgn-195-14-216-63.nc.de. [195.14.216.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2e6a8fsm45654287f8f.37.2026.06.16.07.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 07:57:33 -0700 (PDT)
Message-ID: <18f16dc5-a61d-4499-849e-7f1f7c8364c0@gmail.com>
Date: Tue, 16 Jun 2026 16:57:32 +0200
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] can: isotp: hold a reference to the bound netdevice
To: sashiko-reviews@lists.linux.dev
Cc: Vincent Mailhol <mailhol@kernel.org>,
 Marc Kleine-Budde <mkl@pengutronix.de>, linux-can@vger.kernel.org,
 Oliver Hartkopp <socketcan@hartkopp.net>,
 Oleksij Rempel <o.rempel@pengutronix.de>
References: <20260616123915.674534-1-vasilisalmpanis@gmail.com>
 <20260616125350.B7A371F000E9@smtp.kernel.org>
Content-Language: en-US
From: Vasileios Almpanis <vasilisalmpanis@gmail.com>
In-Reply-To: <20260616125350.B7A371F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 6/16/26 2:53 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
> New issues:
> - [High] Calling synchronize_rcu() while holding rtnl_lock() introduces severe latency spikes and potential denial of service system-wide.
>
> Pre-existing issues:
> - [Critical] Skipping synchronize_rcu() in isotp_release() when the socket is unbound leads to a use-after-free of the socket structure by re-armed hrtimers.
> --
>
> commit da93bcd8877d85ffe0b043e3045c3374b10e38e5
> Author: Vasileios Almpanis<vasilisalmpanis@gmail.com>
>
> can: isotp: hold a reference to the bound netdevice
>      
> isotp_release() looked up the bound netdevice with
> dev_get_by_index(so->ifindex) and only unregistered the socket's CAN
> receivers if that lookup succeeded. This is unreliable while the device
> is going away.
>
> Cc:stable@vger.kernel.org
> Closes:https://syzkaller.appspot.com/bug?id=58676a0f698531996a42612c552e894a55b9732b
>
>> diff --git a/net/can/isotp.c b/net/can/isotp.c
>> index c48b4a818297e..308d18040b6db 100644
>> --- a/net/can/isotp.c
>> +++ b/net/can/isotp.c
>> @@ -1219,27 +1222,22 @@ static int isotp_release(struct socket *sock)
>>   	list_del(&so->notifier);
>>   	spin_unlock(&isotp_notifier_lock);
>>   
>> +	rtnl_lock();
>>   	lock_sock(sk);
>>   
>>   	/* remove current filters & unregister */
>> -	if (so->bound) {
> [ ... ]
>> +	if (so->bound && so->dev) {
>> +		if (isotp_register_rxid(so))
>> +			can_rx_unregister(net, so->dev, so->rxid,
>> +					  SINGLE_MASK(so->rxid),
>> +					  isotp_rcv, sk);
>> +
>> +		can_rx_unregister(net, so->dev, so->txid,
>> +				  SINGLE_MASK(so->txid),
>> +				  isotp_rcv_echo, sk);
>> +		netdev_put(so->dev, &so->dev_tracker);
>> +		so->dev = NULL;
>> +		synchronize_rcu();
> [Severity: High]
> Does holding rtnl_lock() in isotp_release() (net/can/isotp.c) across
> synchronize_rcu() cause severe latency spikes and potential denial of
> service system-wide?
>
> synchronize_rcu() blocks until all currently active RCU read-side critical
> sections across the system finish, which stalls all other network
> configuration operations while rtnl_lock() is held.
Okay this is indeed true. rtnl_lock/unlock is not really necessary as 
now receivers will be tracked
through *dev_tracker*. I wanted to mimic *raw_release() *but maybe too 
faithfully. Just dropping rtnl_lock/unlock from
*isotp_release* and *isotp_bind* will be enough since they are 
serialized under *lock_sock.*
> *[*Severity: Critical]
> This is a pre-existing issue, but skipping synchronize_rcu() when the socket
> is already unbound (e.g., by NETDEV_UNREGISTER where isotp_notify() sets
> so->bound = 0) appears to allow a use-after-free.
>
> If synchronize_rcu() is bypassed, isotp_release() proceeds to cancel the
> socket's hrtimers and drop the user reference without waiting for concurrent
> receive operations to complete.
>
> Could a concurrent CAN receive operation like isotp_rcv_ff() or
> isotp_rcv_echo() executing within an RCU read-side critical section
> unconditionally re-arm the hrtimer after isotp_release() has cancelled it,
> leading to a use-after-free when the timer later fires on the freed socket
> memory?
This is a pre-existing issue that is not touched by my changes so it's 
out of scope of this patch. Its true that timers could potentially be 
rearmed after being canceled and *synchronize_rcu *should be called 
unconditionally but I would do that in a separate patch for it to be 
fully bisectable.
Looking forward to any comment reviewers might have before sending v2.
>>   	}
>>   
>>   	hrtimer_cancel(&so->txfrtimer);
