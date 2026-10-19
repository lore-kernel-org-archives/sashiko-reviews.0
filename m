Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83E83D331D
	for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 11:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410577; cv=none; b=jn+f+FOG7+U+MeLSGy3B1/A/011Eldk1O7b7GNe16GXq7VBVIe9kFPXhxLR6bJzOGo5FpqCvopnWQZXkyMyRSkCq+GX9SEm0kU4Xra/GX1Po8WYstmyaC/SX+DNiz9KgcU7PlVyJR6LPyHKoBE50t3yiZCouVIXXb9z/XQNZEN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410577; c=relaxed/simple;
	bh=F+eUXlB9VQCNsGw/BnGjdCOOD1jtnHYHaQsq8Lw3nXU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e9/qO6NHdVZwgslsjD5aNI16xWYZImyM916tkXYEl0q6rArYewazlgWBvSzXnvjsLxBJe1E36GCIMAJ/rVLDnrLFUSlyjofY+gPqkjla7gdSTeRxfPz2mheJvaEXJxDR3Ee4GSTtPxH9L9sF9kSroyYUoCRThJHud1hnVi7un68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b=guaTBUEc; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard.org header.i=@beagleboard.org header.b="guaTBUEc"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so3152517eec.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 19 Oct 2026 04:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard.org; s=google; t=1792410575; x=1793015375; darn=lists.linux.dev;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fdu26r29oZudM220HDvHSe81ZJ51gRqNF+fkaXqjiTE=;
        b=guaTBUEc4vC/UDQ1YJlFDc+jGoMHvpPwKylMt11zHjo//HAxvoySOuGOdqzleVPJZl
         JJ+BZJF2g7lW8y5NWJ16sW7RPLaO20gUDOplresN/EvtMvrmEdxCryxm7W+3mbdDwKmt
         vXhg0do4BFhM7swMpQPk/7g0cexCI/O7L7bCRZKOp2S94iieFj90qjlUb7f6SpcgqS6w
         myuGsjq5kzV8k8kZDuEZJ6RCqNVX6iexIg4K6c3CgfGDnlgEmMpGTvfoedWuqYCVae13
         dC7ERWihDPxXctWF0J5TER8onSw/BKH5AwsrkLO5RBsjRQ0QH9aZvIxXob/KFTfKrS/9
         jlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792410575; x=1793015375;
        h=content-type:mime-version:user-agent:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fdu26r29oZudM220HDvHSe81ZJ51gRqNF+fkaXqjiTE=;
        b=tXCYPxTZ/dOv3pYmAnwQp2qXpjz25AnVXSP6rK/e7h+7g6ApN+UxkleD2OFqD7VCb6
         /4UAFdR0lDoZ7BNKdN+MU5JACtjVG6Dw1crVcs0aBwwNWW6D8WkUrZBPvBATNt50YKaX
         sMOYmt6X/qdGzc1NRGoSxQce4hhPiNYVxg9O3h/tOFjZuparimOeyvALmDOKj2b66As0
         u7mxdCbOO/Rf0V02kACrknGppUIJ3tlkX84bJwr8SIzu01g0LNCyKRJDL0SjUK//Btxl
         5++pAbARRlIh5nN8fe4vS+6In1PRiUOwwyqT3MVcNh4WGe33ysideEuBr9jOwxFbKfLN
         t+Tg==
X-Forwarded-Encrypted: i=1; AKwUvBzWxE34qGtXdmqlvBDoP8PLyBwNwXNVBbfZ6m/tpylvoFiIr8HFjvJrrWCVMupZtczx85SFH1INvNqYdMF/2Oo=@lists.linux.dev
X-Gm-Message-State: AFq9FYKA1FSUxUPdxBxoQK1z/sgFiPLnMW8sJwpeKkjLBWrMWYJVzipc
	HSIlXf7oF0cx2mTbjxgvfFEP6HoIIVi1t+Dc81QRmY4iCTDOOIq/vgIXZdcbN0Xzrw==
X-Gm-Gg: AYBFou2QW257Slpoy5B0IEOC/QUjYiMFz479kU3yk1uXH+QPhBuseZRrCaT6uXPWAiG
	75N4h5ZNzXMkzmMZPtL0EAWD4XkkvQMfT3AF404bZkYVm9PsJqZxdpbS58nRaG2/xOOT5b6guSb
	nkUClt+zqB1ZW/OAZxxBjlS2J15wCl0WC9Oyjg5/klVncjtV970UFjpyZ46zlJl6N2HwhFVnqbu
	FwXwWdYgPseu+aqUkJH1WAsWCQY9QaiGvR7kQTzmaqnssIqC9V1AgcpDHUfGaE9KmXdvNNjwEVI
	MldHfihgeMDsRsyKPCgXuM7L8U+aDlE3crZKoytSORk/V9fh0nD5cyhfOvroraIe0tjlpWJ+RZj
	X8nZvRo5fcQmUHg8iZsHU/0DJqXbOE/jvXglvpDxglj7psxbxwF+Opb6yXsNSwFZ+lxOtdGIDwg
	DaHzi04dwZTRTg8rEUo0rNasVp+h1fCh7+8KlhEzygNTWXXONQeBc9+GXivOv8DWMc3kHmHhfC
X-Received: by 2002:a05:7300:b085:b0:341:225b:d6f with SMTP id 5a478bee46e88-361a234315amr10888833eec.19.1792410574904;
        Mon, 19 Oct 2026 04:49:34 -0700 (PDT)
Received: from fedorapc ([2405:201:4019:32fc:3c55:6b24:5147:322b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm40017421eec.20.2026.10.19.04.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:49:34 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
To: sashiko-bot@kernel.org
Cc: "Ayush Singh" <ayush@beagleboard.org>,  sashiko-reviews@lists.linux.dev,
  devicetree@vger.kernel.org,  robh@kernel.org,  conor+dt@kernel.org,
  ojeda@kernel.org,  gary@garyguo.net
Subject: Re: [PATCH v3 4/7] rust: kernel: Add greybus abstractions
In-Reply-To: <sashiko-outbox-169737@kernel.org> (sashiko-bot@kernel.org's
	message of "Tue, 13 Oct 2026 12:48:04 +0000")
References: <20261013-gb-uart-transport-v3-0-81d0a8a1acf7@beagleboard.org>
	<20261013-gb-uart-transport-v3-4-81d0a8a1acf7@beagleboard.org>
	<sashiko-outbox-169737@kernel.org>
Date: Mon, 19 Oct 2026 17:19:30 +0530
Message-ID: <877bjdap11.fsf@beagleboard.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

sashiko-bot@kernel.org writes:

> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] greybus: safe Connection methods allow UAF of parent devices
> - [High] greybus: rust: UAF of driver data due to eager drop in Registration::drop
> - [Low] rust: missing #[inline] on trivial abstraction functions
> - [Low] rust: missing // INVARIANT comment and size validation in GbOperationMsgHdr
> --
>
> commit 75320c1f601296bad85db7371e32bc7e97df53b7
> Author: Ayush Singh <ayush@beagleboard.org>
>
> rust: kernel: Add greybus abstractions
>
> This commit adds Rust abstractions for the Greybus core to support implementing
> Greybus host drivers in Rust. The abstractions cover the APIs used by gb-softsvc
> and gb-uart-node drivers, including host device registration, connection management,
> and SVC protocol structures. It also introduces lifetime and ownership rules for
> Greybus messages and callbacks within the Rust bindings.
>
>> diff --git a/rust/kernel/greybus/hd.rs b/rust/kernel/greybus/hd.rs
>> --- /dev/null
>> +++ b/rust/kernel/greybus/hd.rs
>
> [ ... ]
>
>> +    unsafe extern "C" fn message_send(
>> +        hd: *mut bindings::gb_host_device,
>> +        dest_cport_id: u16,
>> +        msg: *mut bindings::gb_message,
>> +        gfp_mask: bindings::gfp_t,
>> +    ) -> c_int {
>> +        // SAFETY: gb_host_device and HostDevice have the same layout.
>> +        let hd = unsafe { Device::<device::CoreInternal<'_>>::from_raw(hd) };
>> +        // SAFETY: message_send is only ever called after a successful call to
>> +        // gb_hd_add, hence it's guaranteed that Device::set_drvdata() has been called
>> +        // and stored a Pin<KBox<T>>.
>> +        let data = unsafe { hd.as_ref().drvdata_borrow() };
>> +        // SAFETY: The caller guarantees msg is valid for the duration of this call.
>> +        let msg = unsafe { Message::from_raw(msg) };
>> +
>> +        match T::message_send(&data, dest_cport_id, msg, Flags::new(gfp_mask)) {
>
> [Severity: High]
> Does this code allow a use-after-free of the driver data?
>
> Thread A could initiate a request through gb_operation_request_send(), which
> calls this message_send wrapper without taking locks that serialize against
> deletion. This wrapper borrows the driver data T via drvdata_borrow() and
> invokes T::message_send().
>
> If the hardware receives the request and replies immediately, the response can
> be processed by gb_operation_work() in a workqueue, dropping the operation's
> active count to 0. Meanwhile, if Thread B executes Registration::drop and
> calls gb_hd_del(), it cancels operations. Since the active count is 0,
> wait_event(!gb_operation_is_active(operation)) returns immediately without
> waiting for message_send to return.
>
> When gb_hd_del() finishes, Registration::drop eagerly extracts and drops
> the driver data. If Thread A was preempted inside T::message_send or before
> returning to C, it could resume execution and access the freed driver data.
>
> [ ... ]
>
>> +impl<T> Drop for Registration<T> {
>> +    fn drop<'a>(&'a mut self) {
>> +        // SAFETY: By the type invariant of Self, self.as_raw() is a pointer to a valid
>> +        // struct gb_host_device.
>> +        unsafe { bindings::gb_hd_del(self.as_raw()) }
>> +
>> +        {
>> +            // SAFETY: hd is a valid pointer to gb_host_device.
>> +            let hd_dev = unsafe { Device::<device::CoreInternal<'_>>::from_raw(self.as_raw()) };
>> +            // SAFETY: The driver data was set to a T in Registration::new() and has not been
>> +            // taken since, and this is the only place that takes it.
>> +            drop(unsafe { hd_dev.as_ref().drvdata_obtain::<T>() });
>
> [Severity: High]
> Can the eager drop of driver data here lead to a use-after-free if
> message_send is still executing concurrently?
>
> Since gb_hd_del() may return without waiting for message_send if the
> operation's active count drops to 0 (e.g., from an immediate hardware response),
> we might drop the driver data while Thread A is still executing the wrapper
> or driver code referencing it.
>

I feel like this particular race condition should be fixed on the C side
instead of the Rust bindings. Put simply gb_hd_del should first flush all
in-flight operations, and prevent new operations from being executed after
the function returns.

Of course, I might be missing something, so people more familiar with
greybus can correct me if I am wrong. I can work on the patches for what I
described above.

Best Regards,
Ayush Singh

-- 
BeagleBoard.org Foundation
https://www.beagleboard.org
