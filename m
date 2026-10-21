Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619897;
	b=SvUqcntol8Ckuug5ofGO04k3xPtCf7mIQ0v3jMEjeyNob01+bVVTRHteFEAQ1diobo3K
	 amJCgdC4NB5miA1u6uMUKPM/u4OxNzNkPJxzl0YzbTeh8DWrW+JWwGeYUX0FASUBUT1nC
	 6YYcpStyps+nHVQoUq2kMZaBokgRDuHPPGS4BFYsu7DDU/o4+bxxCMCT31A3YAD16WiSJ
	 /eJ7GElHyhoh+CsFSjFbxL481h/0iyHdc7ltkVq8pqRJ4Th6cBFLCMtvIEgKEiHYE4R2g
	 t/yqUgjwYxsfvzBXV6PHeQFPvMzf4rAlv4ce59QL7xjfLZ0dpyPA2w9I8IyGsm/bMUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=vjlrFc8ai6S+8VJ+lvNd8+aoLJdpX9LDqDVung6V/EU=;
	b=z1x+IhrOlthn1usZRVoaHYx30v63+HuzXm3pcvzVJJVFZEY5gsqWEhLOFN2Vy26cqRfq
	 75btBr3qlfxZSFNuIwZASDzwyTks6+d7hZUgRen9EB4fl9UpZbpY/uDBzpbFG3CqpVWHW
	 7RwzrmR2gcbET4lzkSjltcihYRWmK8LAAMU6Om0BNzWEKWLLhXjYI1aanLKXVCO+wq0LP
	 oIA0ZNKPnly5zJChd9ohABowlVBcOYvDEAWxnMJ/lQeqNZeoMoF1bc/CBpGkt6fma1Zwx
	 47rb/q5/rt+7ETZrz4mIrMKySGYkTwh5ynow+vmVmlocvE7iZctw5zuJjStTTTpSP9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b="AoT8/uzW";
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD89606A325
	for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 21:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD89606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=AoT8/uzW
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535a54bed9so1674824eec.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 21 Oct 2026 14:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792619896; x=1793224696; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vjlrFc8ai6S+8VJ+lvNd8+aoLJdpX9LDqDVung6V/EU=;
        b=AoT8/uzWtgus+qtzb+S74KMFIbZrTMFHceIQ/QWYTPKY0+Gp1RmZ0/n/tGv8kiTloD
         QkaWaBIceBdINg4OExYrFcOQsC2ZjEfYrLCfG4Q1A0GQxwFP4lS2Z2eNLnIPOJwPtm6F
         p6nAHCfkphKx+xKj/MWCmvaDBlSVksVaBNtU/OFaISGqzk/SKc9d3Px9cY8FWAWfLKEK
         CmjUktM9UxcTzdQ5+B7oYuTqAVPsEHcYYTmsEeLi59nRMWxrcWrh0mJHs4rCmn9PJ4Z5
         /+ytog0fJbZ8JbuQ78XOmKsM/HlExYbL0sTLdygcnCrJFN5OjfAcn+JcloyArnFQEbpb
         gFRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792619896; x=1793224696;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjlrFc8ai6S+8VJ+lvNd8+aoLJdpX9LDqDVung6V/EU=;
        b=oF0B99L8GfTH48vvqdRZJdkx6x8pBYZlzvlw/6I8aR+wf0IJm+00sZfWsdar/9zJEg
         4L9aEUq+9bussE88pzXP8tq1Ziym0mNSyxGUnumr/A92WhZAnINhq3fLCtUyebiEVlzu
         h50XhAqOXgCVkePHx6SjPVIa2lzoNXUQZ6Vgc6VfiXEDSTR/jfAi96RWwVYS8xfAAAtB
         VaOs092dE46EjCJfFqvKIFom9SZeWgCnzgjAO795ufbjesBUP+a53Hx0jpkgmT8h0Udj
         nlzA5GIKEP5CFu+mv68vrOMXBFztOdl6lu8tqfJ9yQ5Tn+PS9DDAAzPNXKmnfAQv3RMk
         kUPA==
X-Forwarded-Encrypted: i=1; AKwUvBwMdNrfqrM3QH3ViozP/tzZ6j7bxFNwMo07fPUnX4ZgnsTCkupYdT7eVBq9U6n1RubSJ8xSZRj0U4fqT+XLa6U=@lists.linux.dev
X-Gm-Message-State: AFq9FYISmvbKhUdpGtJSahMgcL+pzOeJHxUl5sru8DwcdqO5wMIONIaj
	JIhEg7rW6yT+6XLljMkCe2TlrrIV8eTt6mQoIMBHSLFnBorveRqfEA183do/hviF/7Q=
X-Gm-Gg: AYBFou3KgEE4UVrHdF8jdBu1ud7+MZ4n8WIfCraP50dj+h4iszTu5AS62tdN4kJAKnX
	k/c3bfGbAU55ogjiX4XELobISBXLkyQFiMTValFcLjbFaNuYg38/6z9w2/1+Fu3VtYOCOVeDg7C
	JCNd6pOI4RPlmWDwJQBALC0Wilxas2v4fwr0kGEh+hZhEcAYx+bihpaOVbYULh2n75Awlm3Lq1T
	TCZIgzGIrRyyRkyNpUhmFMQT77zK2DzGbTsoB89DUd03AOWNE6uKnqUxmcxIU8cVkz209JzRFpg
	+ciSPp5moXE7NvvuxuP6o9x8U1/qbmLJLmXTd8eWGvIskGrtZJHUrFGuh4M+r93W7mXhJN6B68h
	Lme7bd+cCpWj/2/YiPQZ8HkjPQ1T4ksaBYEZZVqAlEen+AP4vePNR/p4iqvkSVB16Sw3yh934NB
	J/v2D1sC3YCc5UZJ5zVl2lfEK3VsJOHtjHVwt2DVAw9mgFzPwTnrzdlcjnewfQkDKM+chRjobNk
	MAEAyc2D0Mc2o2mV5VgMikPCqqUQM+UUXqQO53ajueMBu+biK4nnIwA
X-Received: by 2002:a05:701b:4283:10b0:15f:28e1:7c7d with SMTP id a92af1059eb24-190a86ade90mr4009050c88.42.1792619895746;
        Wed, 21 Oct 2026 14:58:15 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm8941979c88.14.2026.10.21.14.58.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 14:58:15 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Oct 2026 14:58:14 -0700
Message-Id: <DMAUPUPEBZ7W.DB96YQGOYZAI@nexthop.ai>
Cc: <devicetree@vger.kernel.org>, <linux-hwmon@vger.kernel.org>,
 <robh@kernel.org>, <conor+dt@kernel.org>, "Guenter Roeck"
 <groeck7@gmail.com>
Subject: Re: [PATCH v2 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <guenter@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>, "Guenter Roeck" <linux@roeck-us.net>,
 <sashiko-reviews@lists.linux.dev>
X-Mailer: aerc 0.22.0
References: <20261020-hwmon-pmbus-fs1412-v2-0-3396c3a08251@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v2-3-3396c3a08251@nexthop.ai>
 <sashiko-outbox-178650@kernel.org>
 <dd1781b2-4637-4997-bdfd-d71fc35837b0@roeck-us.net>
 <DM9W9SZZV7OK.33TH12KSMSBQS@nexthop.ai>
 <DMASAV68R9CA.GRPDV6UG4MEU@nexthop.ai>
 <599f18f1-7ef5-475f-9ea2-9a2059299751@roeck-us.net>
In-Reply-To: <599f18f1-7ef5-475f-9ea2-9a2059299751@roeck-us.net>

On Wed Oct 21, 2026 at 2:41 PM PDT, Guenter Roeck wrote:
> On 10/21/26 13:04, Abdurrahman Hussain wrote:
>> On Tue Oct 20, 2026 at 11:58 AM PDT, Abdurrahman Hussain wrote:
>>> On Tue Oct 20, 2026 at 8:37 AM PDT, Guenter Roeck wrote:
>>>> On 10/20/26 01:55, sashiko-bot@kernel.org wrote:
>>>>> Thank you for your contribution! Sashiko AI review found 2 potential =
issue(s) to consider:
>>>>> - [High] hwmon: (pmbus_core) divide-by-zero after pmbus_regulator_set=
_voltage()
>>>>> - [Medium] hwmon: (pmbus_core) broken relative VOUT margin handling i=
n regulator ops
>>>>> --
>>>> Good that I did not just apply this patch. Do you have time to look in=
to
>>>> those issues and fix them ?
>>>>
>>> Looking into it,
>>>
>>> Thanks,
>>> Abdurrahman
>> Addressed all sashiko comments in v4.
>>
> Yes, series looks good. I'll have to wait for the commit window to close =
before applying it.
>
> Thanks,
>
> Guenter

Thank You!
Abdurrahman


