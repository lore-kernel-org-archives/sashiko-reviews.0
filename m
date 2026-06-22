Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101481FA859
	for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 19:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782155096; cv=none; b=Sb3wLV+ooav1gV5CKexb/60djO1EIyn4eCIzXIk3ziZzJvF/EqML2exA1wIAFAH8oudpWtiisfZsOPtWoYBlSIYMH9eXXurzfpQn7joV3OtqAz8eYUCYx1MevaDSzGPx7Mi9aNm1D2UrWGcic72TFJop1hVz64rKG4pT2ST/H5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782155096; c=relaxed/simple;
	bh=ShHbZ1ZNW78ZoUWEkTBJ9s2OyXd5OTwbufXBnfys6KY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lKJZV4dpyXtf1Dw7NlktHY2viW3SuylRUVcd6eDyZXNQjx9V0MLV+PF8+waMo18VJGlPr5OFbTw6srtgiu5GxEfVPv9w0MENgdO6DEF74rLWMRMCcOLJNH1QCLC8vXZkWNgY6oYAYwEVVoVfJMcFGwhBpmBkyNETrJYSD20T5Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WV+yczGv; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WV+yczGv"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6974edf4c84so3513057a12.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 22 Jun 2026 12:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782155093; x=1782759893; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3VJ0UZP+KwFN7MAAYe9I9DBthlkqlN1IgSIedgq86o=;
        b=WV+yczGvGNZwZqn0AxJwMdnotDfLfI2hLrzAHTUq8twx1Cfw/nbic8yFJq/Zi0MUGw
         2QXyqRY5+yhL1F/6RiQJbqJWfv5iWulYVTYKHFjZf4NukQMJnmavKvBunbJDczlOtmMV
         twix/D8CaEmFAfNdcJxqqQ7UVmyAYt76zSrbc9bXyrvQxAo6HKmOS7hgmZjkCv2cL6Lj
         KFudjJEfW/ChveNklmx5C7gTlfMGm1IQ2XSZce409RcYk+vzq7S9yQ3KrCATiQYFC+6U
         hTKtGkqRx/TIZO5srnvmi1hYgKMSFGa6a2f06Y/R2WywHn357my2ewH98qZwDEAure9T
         aVVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782155093; x=1782759893;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F3VJ0UZP+KwFN7MAAYe9I9DBthlkqlN1IgSIedgq86o=;
        b=Mhj6/nrtd414v3ll7HxyjsqYiTXBeEEbpg2iShBLyQF4JrY1RaCp1tbZjP/DmJR8Ug
         /AWkqUw+NxP9vaGIgsPMI0fxungF0F7jp+eUT1iadbUTeJJaoA0LBfLJFmz9G8q+XCsG
         O+YqOWsQox5qIoiaNiiKoDORZxGFeEd7BaVkpPX2QY61wfpx5JN85SIv840twpZLD/G4
         l1vn9jRMwU+r7kraVbfhX7INXykYrvT0ONIYyp5BRBhlBYDgrns1yhhdd3XTe6W62UNo
         QqUvu+RRmjXE5G2gmIF1vkp9gTv7/iJbfOXnRyq/eNElI5H8gFKTsAb1RfKBszJke0NL
         +9BA==
X-Gm-Message-State: AOJu0YzNfsWFGTT/7XU9k6VJ9bAxnilIpN/XvFg1VBPmZFoSiSz1lyW0
	Qn+3CtWJfeWCsm+D18VeHiI/OHpB7qE/0pcukuU3KDBNK3gmCKR6ySzTzaUfTfQqXgxMh4sItbY
	Q7waw4GJ5XrYHOATRnOCJBHuIuEeN7kb761a4zng0HgL3f6ZEknk6Wwn9HYGBhNsWsLxs0pwIzP
	smcDTR5I6j1rkslHbuz5ubV30sufFju9dEF9NjzQwLaBzFbisf0Oc02wQLLl8h6XW9
X-Received: from edfg21-n1.prod.google.com ([2002:a05:6402:a255:10b0:697:908e:d35d])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:524b:b0:696:565:a9e7 with SMTP id 4fb4d7f45d1cf-696edc6cf37mr7551305a12.9.1782155093205;
 Mon, 22 Jun 2026 12:04:53 -0700 (PDT)
Date: Mon, 22 Jun 2026 19:04:52 +0000
In-Reply-To: <20260622185427.2365D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260622184851.2309827-1-tarunsahu@google.com>
 <20260622184851.2309827-8-tarunsahu@google.com> <20260622185427.2365D1F000E9@smtp.kernel.org>
Message-ID: <9huzo6h2qtuz.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH v3 7/9] docs: add documentation for guest_memfd
 preservation via LUO
From: tarunsahu@google.com
To: sashiko-reviews@lists.linux.dev
Cc: kvm@vger.kernel.org, kexec@lists.infradead.org, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, seanjc@google.com, 
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, mark.rutland@arm.com, 
	ackerleytng@google.com, Paolo Bonzini <pbonzini@redhat.com>, 
	Alexander Graf <graf@amazon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

sashiko-bot@kernel.org writes:

>
>> diff --git a/virt/kvm/guest_memfd_luo.c b/virt/kvm/guest_memfd_luo.c
>> index c242b1d14c0ac..8411fe86dc2a1 100644
>> --- a/virt/kvm/guest_memfd_luo.c
>> +++ b/virt/kvm/guest_memfd_luo.c
>> @@ -119,11 +119,11 @@ static bool kvm_gmem_luo_can_preserve(struct liveu=
pdate_file_handler *handler, s
>>  	/*
>>  	 * Only Fully-shared guest_memfd preservation is supported
>>  	 */
>> -	if (GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED)
>> +	if (!(GMEM_I(inode)->flags & GUEST_MEMFD_FLAG_INIT_SHARED))
>>  		return 0;
>
> [Severity: Medium]
> Should this functional logic fix in kvm_gmem_luo_can_preserve() be split =
into
> its own patch?=20
>
> The commit message explicitly states this is a documentation change, but =
this
> modifies the condition for GUEST_MEMFD_FLAG_INIT_SHARED in C code, which
> violates the rule of one logical change per commit and makes tracking bug
> fixes difficult.
>

OOOOPS, This (and the below) should be part of previous patch, I will
have it fixed in next version next version.

>> =20
>>  	/*
>> -	 * It makes sure that no memory can converted to private
>> +	 * It makes sure that no memory can be converted to private
>>  	 * even if it was initially fully shared (in-place conversions are
>>  	 * prevented).
>>  	 */


>
> --=20
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622184851.23=
09827-1-tarunsahu@google.com?part=3D7
