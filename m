Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793242866;
	b=JU0V6ClnKOoeKVL6jVpvYSoD0kTI9C1TcYqwrb+wl5xrgduV1m7cKLBRMtgPJA0IM/2N
	 XisERHcGCAILFVNkMrznc73QbvXpkLRHX557zXXe5F3eKOOMdKXTXNAjsdqKZ89OAqLfZ
	 w01zOZQ9drywIaAWTotqoHM2L78JpqzhrDQoYneDmXdNMXj4w6BuCjPSAI4nqKqnHXI+9
	 uFV+zIXDnRzvF0xvV1KHtOAtPnzN9AcPgQdRlgPpw28NSOcaVPN5vnyRLquAFcQ6dqIO1
	 UqhzHQ3hCIGZKzKhbEbrTK7+xw4mJsodiX6/yf4r0GXh3OGA5rmJMTy8Py32Ex6SCxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793242866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Bkm7zevt2pJ24dJThsCd2BuWJE9RCkG+R9d+KkvdTQI=;
	b=ai2qtTT6/RDVEtr9PQWC7Oo/zQp+Jm+TDuxeGLKeSV+m2kusjh924302osm3k6QegaLb
	 9JT/Mmn6G76xN4vfeHd0GoEXdng//Cflon2OUuA4Tdtdd4ozJ8rHuC8iEUDJlqSwSZ6IL
	 ujcShn49TcWY6Dxie6c9swipUMJVYmYapRRl1ZP5hSbDTpGFnpKSY6caktt+6/hE+o54Y
	 bovCWqB4Ev0dgtkbYtzU5qL+8AiQimXbQqJFvrJghQtZJidwTE4The3pLpJ3ChYXOBllm
	 htbWvGeQOMEN+OXrf3QDdDyQpmVovwnd2CGHyeRw28zFCmfrciXKJx4oKpFbyn6NLUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AiByQUxj;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278BB606A323
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 03:01:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 278BB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AiByQUxj
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e985106c0cso14353605ad.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 28 Oct 2026 20:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793242865; x=1793847665; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Bkm7zevt2pJ24dJThsCd2BuWJE9RCkG+R9d+KkvdTQI=;
        b=AiByQUxjj5TxmHqMsPRfUmaLyscEwEjcJ+agrWiyh8+OD0/NjTf3p4InuZkhTFg/W8
         woOG+pYrGOH3n6J4d82dtt+wi5eQIqE0hT8+VD9i9/EY983nDJi8g+oucl4Ep3UFrA01
         esrd4CShV9E9892f22v1ooZ2NVVvW2mK6TeAG0I/VvZ01H0v4Cid1+CeT083dUsfPgR4
         QmAaWy26yBwQQU5xVwa3AxC4h6qn0dkASOPhLJPLpVIKBFrcop0M+OfpwoF1Dn4BF91Q
         5gJl/dYkX3aOb2c4Nnk9OtTJWZ7pGhyLRKFmzsL7585cNfWS35DBe1BZfBqxp/UGMyVt
         QQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793242865; x=1793847665;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bkm7zevt2pJ24dJThsCd2BuWJE9RCkG+R9d+KkvdTQI=;
        b=qb8NfjBryNc3W0AunQV8tNh987Q261df8ApWA0NL6WZ/se2KTeTziaHsc8cl76MBc+
         0FsaCOfPt5EcCRFNz7ZSqtEw7a89bZOBNocAIelmmTAHe8S9pPKX5b12Jm+YTnH4d/4X
         T0FVbOaISUAn7zejDZMxCsMwJt9fT+J/DBQkQU6UGY0DPsVj44VqMaZ2QyAIl6XmSXBx
         WwGemQ6rUOu89Y9CDU7u7HghGjm2EQ2wIFxHx1i2/3o9DXFdociw9HoaOaBgR5bUX3wG
         R5dvOLb70ckOZRlsrUnXbgpb1Pu/V0+KQ/7F+V230QEYECaA1CvaJTPm21wCA/D1Bb6I
         IMJA==
X-Gm-Message-State: AFq9FYKtjRih6Hpq2Tj7ek8Vg82XZb6jt8acYCOcpHgU/zsSuLNmaSfG
	zROc/vbTA3Fmy3sbhP7pmtxCg5Tczbn5Wwf6KtOLceX6LGVzudel4LC9njVGrlljMfWsrw==
X-Gm-Gg: AYBFou0aoP4dxXmaeNb/5kgJ+Zfid6VFn2aYxbOP/m+4JXU2qrpn6YocPsdwhg45Qd7
	n39aI53wsxMbj2HK3ooYgZrub178XldS6yg+qIpZ31HUs5PEvAlPyED2w2QXz6ZCidV+CpTepWC
	mk9S5M8iy+bz9q9ABxBz08Knr+kD4e/MlE7fnZ8bccJFH480rLmZEqs3SdjwKh/kNZSwYBnX/T6
	rZXxqwtSrYmoSwfys361n3exflx72gV9kqVl6ULbqFh/5FBfjYcJuupl3+aR5vWg3cdPOeDSCJu
	DK9zIFJbSZGcMLu/0C+b50wYPslONGEQySUD8Sx/wjxwlU0qGovc4ZBGsazyChUdEIDAgN82BJT
	ryIbmG9EMh43VGCwNORUPR/lgnSKE0RLOCsIioN5ATBUNcND13PiuU8B/5QJbMmaDOAOirMFlk2
	x2NSr1ZnkriOZjIlg1GB9U3XugK3jIeqS8Q+IbHjIpXQdhPmUSywRB3QazBRH56d5FcWL+JOhgy
	uo041ix2oKo6Z+IGft2+XjmgyTccNGC03xWKKWPvIL69Xq17jIoAoNoMdFnLflFam8OLDK6+9Lt
	X67yq88uBr+2tJDAwX6tLwQA1CCejuTF33PqDkiSJH0kmzty0bOEE8OEbVsh2kvRMrOaKu46bo/
	scr/4q1FrYxYF5BvAoHV7jpIccfYeUg==
X-Received: by 2002:a17:903:2cf:b0:2e8:1f8a:9113 with SMTP id d9443c01a7336-2eb00541fa3mr35157725ad.40.1793242865314;
        Wed, 28 Oct 2026 20:01:05 -0700 (PDT)
Received: from [192.168.52.49] (ec2-35-77-214-194.ap-northeast-1.compute.amazonaws.com. [35.77.214.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6b7a216sm26722755ad.16.2026.10.28.20.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 20:01:04 -0700 (PDT)
Message-ID: <8f353f85-b8b7-4808-9a18-86a8cfff307f@gmail.com>
Date: Thu, 29 Oct 2026 11:00:58 +0800
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
Subject: Re: [PATCH] mm/damon/tests/sysfs-kunit: fix leaked pid reference in
 add_targets test
To: sashiko-reviews@lists.linux.dev, sj@kernel.org,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 error27@gmail.com, wangkefeng.wang@huawei.com
Cc: damon@lists.linux.dev, linux-mm@kvack.org,
 "Liam R. Howlett" <liam@infradead.org>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@kernel.org>
References: <20261029015725.17378-1-xiaoleiwangxiaolei@gmail.com>
 <sashiko-outbox-188628@kernel.org>
From: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>
In-Reply-To: <sashiko-outbox-188628@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/10/29 10:02, sashiko-bot@kernel.org 写道:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] mm/damon: memory leak of ctx in damon_sysfs_test_add_targets() on skip
> --
>
> commit 15e9d751202cdf7c593524fe7b4266b6f6dd0dbf
> Author: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>
>
> mm/damon/tests/sysfs-kunit: fix leaked pid reference in add_targets test
>
> This commit fixes a struct pid reference leak in
> damon_sysfs_test_add_targets() by calling damon_select_ops() to select
> DAMON_OPS_VADDR on the monitoring context before adding targets, ensuring
> that damon_destroy_ctx() invokes damon_va_cleanup_target() to release the
> pid references. If DAMON_OPS_VADDR is not registered, the test cleans up
> its allocations and skips itself.
>
>> diff --git a/mm/damon/tests/sysfs-kunit.h b/mm/damon/tests/sysfs-kunit.h
>> index 138a4b8d14e73..634387c6178b9 100644
>> --- a/mm/damon/tests/sysfs-kunit.h
>> +++ b/mm/damon/tests/sysfs-kunit.h
>> @@ -79,6 +79,14 @@ static void damon_sysfs_test_add_targets(struct kunit *test)
>>   		kunit_skip(test, "ctx alloc fail");
>>   	}
>>   
>> +	if (damon_select_ops(ctx, DAMON_OPS_VADDR)) {
>> +		kfree(sysfs_targets->targets_arr);
>> +		kfree(sysfs_targets);
>> +		kfree(sysfs_target->regions);
>> +		kfree(sysfs_target);
>> +		kunit_skip(test, "vaddr ops not registered");
>> +	}
> [Severity: Medium]
> Does this error path leak ctx when damon_select_ops() fails (for example,
> when CONFIG_DAMON_VADDR is disabled)?
>
> Earlier in damon_sysfs_test_add_targets(), ctx is allocated via
> damon_new_ctx():
>
> 	ctx = damon_new_ctx();
> 	if (!ctx) {
> 		kfree(sysfs_targets->targets_arr);
> 		kfree(sysfs_targets);
> 		kfree(sysfs_target->regions);
> 		kfree(sysfs_target);
> 		kunit_skip(test, "ctx alloc fail");
> 	}
>
> When damon_select_ops(ctx, DAMON_OPS_VADDR) returns a non-zero error,
> kunit_skip() aborts the test immediately without calling
> damon_destroy_ctx(ctx). Should damon_destroy_ctx(ctx) be called before
> kunit_skip() here as well?

Agree, fixed in v2

thanks

xiaolei

>
