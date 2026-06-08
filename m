Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9363C4574
	for <sashiko-reviews@lists.linux.dev>; Mon,  8 Jun 2026 18:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942979; cv=none; b=roOF5kpNyrcvTD3RCe+0XcvGQOqjTMpYs1Fp1zIF6Wzf97PG6loblIVCds4We4uFsF4alffY0MrrbGH/+POS57HdHP4z5UNGHJRGAPOq3YOMV1c7NwDVfcpwJOMayn0Z66IjpUKYV5U9FpEh6j1i/k6fi6Fncemk2wRFyyFeXwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942979; c=relaxed/simple;
	bh=v6Y3fa7kX8cOD75Cvz/PmmMEKU1iHPrCF8yX1Opx2XE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oaw2JzElRR7IuJWS9/WaG+QpTwVAI8IN0VKHOvm8CtCPkJM7hv1NNWKsNaUdMmFbanT5ec0aGw0qXL4ImEHn6zEfqoxX2WosrzaqskaoanCk/2BiaWMMQJ9fR3wXJ85DKNzWPM0XKYDBd4rRpi8mhUUfn/uf+PwZticLtj7k8o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LyhgVpJZ; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LyhgVpJZ"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-bf5ea9d140eso203893166b.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 08 Jun 2026 11:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780942977; x=1781547777; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SosLKBVvUMZz/rhhs2ynRuPONsMChlqS4SGtsVqD34c=;
        b=LyhgVpJZ9Fa7HF12f22NHUH3W9UI8iwBvf1ohgRhO8XnpRQLM9Vv/foZDP6PCodQlz
         rwt1BIQRLP94ena8DdpS3KK1eXK5qy0O2c8aRFSJQMOjENmXZoSy/GlJnvXlg2sI/4Kh
         6lHL2xwsLqE3gy/iXvcTwidm+9gEOhhhYV+aj4aOAAThpJm0OL3H50NpC6Uv8Pxn1/u2
         JOYhnajsknCh8xHLm1QX7BN5GF5Y31FgW29nnYrHFiKkgWuRhZja/hL2eb6gdVpEQexI
         g8RXVz9frA94LJpqkBWu3BTpe/EEXxhf6LrGHIT84KpwVbYr2KTeOHlCZw2M4Owm3xny
         C96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780942977; x=1781547777;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SosLKBVvUMZz/rhhs2ynRuPONsMChlqS4SGtsVqD34c=;
        b=aTsx/wdsgwVW50icbMbSAW55ljJkR2YZ2ITSMx9zoCdEQ3b/w6G8uMRwx4rlqI6Nqg
         onk6GpM1y5BtuQTjlBeJbMbdxMOdR3IpSTrhRqP9I0KUUGI9ZCG1OcM0aHTco0ENfQir
         mXCXKf2mW4RQzewbad7lpGIktD8lzfcq5t2DZfPKgMyX9iWlrZga91TDb8yFnap7t/Gs
         R9Np+R3Umuv2AI+r/941r/SmijYccrgZwuHXDzoxDtETeGrGJDrV6SyLYj0ST4Mu+fhW
         9AaEEan4qTjB6SW3V149ovbloEgOU8UPB8oRxEjykjWRlZXBrwedKD20G6YNzevfu1WF
         MF6A==
X-Gm-Message-State: AOJu0YzzNybKduTQUNv2ScJn9fRIV3+NOxGIEOxL0X6Wle0TMIeNuDsJ
	DDsKRlclDrGMJAYwzgmrUfBp+CZ6KExiWTA7cdlZxdL6DLVPvPdCw3OJciqIpmAKhGyhFGsUyy+
	jVRLXVW3iBSewMhPQLLKTBE8rV96tb96fhC0jmMxXReXgLmQKfvddG3fIS6UNuKg5cOS+uTs4cx
	D1WLEemvtf+qPPkOpSwY3D3s6u0W53Xl0GRnOyzsDJxlbwQZ7Ct0cEaR2E1+1MBwtC
X-Received: from ejet27.prod.google.com ([2002:a17:906:179b:b0:bf0:cf6e:c85])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d89:b0:bee:72b9:f5a4 with SMTP id a640c23a62f3a-bf3a70fdd2emr636456966b.13.1780942976837;
 Mon, 08 Jun 2026 11:22:56 -0700 (PDT)
Date: Mon, 08 Jun 2026 18:22:56 +0000
In-Reply-To: <20260605172557.DC6A71F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <4b2216f5c459fe699a3f62464cbc765624e20ae6.1780676742.git.tarunsahu@google.com>
 <20260605172557.DC6A71F00898@smtp.kernel.org>
Message-ID: <9huz5x3syjr3.fsf@tarunix.c.googlers.com>
Subject: Re: [RFC PATCH v2 07/10] kvm: guest_memfd_luo: add support for
 guest_memfd preservation
From: tarunsahu@google.com
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

sashiko-bot@kernel.org writes:

> [ ... ]
>> +static bool kvm_gmem_luo_can_preserve(struct liveupdate_file_handler *handler, struct file *file)
>> +{
>> +	struct inode *inode = file_inode(file);
>> +	struct gmem_file *gmem_file = file->private_data;
>> +	struct kvm *kvm = gmem_file->kvm;
>
> [Severity: Critical]
> Does this code dereference file->private_data before confirming the file
> is actually a guest_memfd?
>
> The LUO framework might pass unrelated file descriptors where
> private_data is NULL. By extracting gmem_file->kvm before checking
> inode->i_sb->s_magic, could this cause a NULL pointer dereference
> when evaluating unrelated files?

Oops, This is a bug, I will update it.

>
>> +
>> +	if (inode->i_sb->s_magic != GUEST_MEMFD_MAGIC)
>> +		return 0;
>> +
> [ ... ]
>> +static int kvm_gmem_luo_preserve(struct liveupdate_file_op_args *args)
>> +{
> [ ... ]
>> +	end_index = size >> PAGE_SHIFT;
>> +
>> +	ser = kho_alloc_preserve(sizeof(*ser));
>
> [Severity: High]
> Could this call trigger a NULL pointer dereference if the KHO subsystem
> is disabled?
>
> According to the KHO subsystem guidelines, all callers must explicitly
> gate KHO usage on kho_is_enabled(). It looks like kvm_gmem_luo_init()
> registers the file handler unconditionally, and this path invokes
> kho_alloc_preserve() and other KHO serialization APIs without checking.
>
> Should this function (or the initialization) verify kho_is_enabled()
> before interacting with the KHO subsystem?

Luo already does the check, this review in incorrect.

> [ ... ]
>> +static void kvm_gmem_luo_finish(struct liveupdate_file_op_args *args)
>> +{
>> +	struct guest_memfd_luo_ser *ser;
>> +	struct guest_memfd_luo_folio_ser *folios_ser;
>> +
>> +	/* Nothing to be done here, if retrieve_status was successful or errored,
>> +	 * Cleanup is taken care of in retrieval call.
>> +	 */
>> +	if (args->retrieve_status)
>> +		return;
>
> [Severity: High]
> Does this logic inversion cause a double-free on successful retrieval?
>
> In kvm_gmem_luo_retrieve(), a successful retrieval frees the ser struct
> but leaves args->serialized_data intact:
>
> kvm_gmem_luo_retrieve()
>     kho_restore_free(ser);
>     return 0;
>
> Because standard Linux error handling uses 0 for success,
> if (args->retrieve_status) evaluates to false on success, causing this
> function to fall through instead of returning.
>
> Could this lead to accessing the freed ser struct, erroneously putting
> active folios, and calling kho_restore_free() a second time?

retrieve_status is 1 when successful not 0, this review is incorrect.

