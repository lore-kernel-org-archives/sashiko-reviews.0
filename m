Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623DE3F7875
	for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788179315; cv=none; b=YD0uLrtbSnd1vj/5h+U7hH0ToqGC58UTxOHWRSo8vwIFsVeWN/2k5hOB4pbCMJSeQ+fh2vXDpeUX8l8Qdrm5Tq+pL7dMv/68RK3f8PAJShd6aNKbxyXT8Xk+Z61+2rCoDnbx/XAe7YlKn42DwYzRYolozQNBpG2bfYcGH3ZtGw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788179315; c=relaxed/simple;
	bh=ZKp4/QBeYSAV2k9bPiW/sTkKtSRTNNMONHn+AGg4GEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OMKfjFVeCah71AThGw4/Ge2NN0ZiR6uX+5tWIK2moagbQAEJ3O+aatlFSKPoxUFj9xFXqGHdBzx48JLzNr1jd4Ny6EPRRwLL6CsJq7Edygia9nO4VJVOPA30juQ2tdYXTITGJrRra0mepOfu4K6Rsha9hbiTC0k/FckczTzLDYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OESiEI3Z; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OESiEI3Z"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso3326815a12.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 31 Aug 2026 05:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788179314; x=1788784114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jyu9EWq7gK0JjEZiz+ImWml7ed1HDT5ZIEVxolEFw4=;
        b=OESiEI3ZB8xgY3FbC+yzVD1agEkuO8Kcxq8/M0kFJwBlcDkZ48yPl11dqjZFlpUKob
         qDpziCXmcuE9lD/mkmZ5I+3BOwaQI/WW4FIfoshHwsPx137eov61LK+wU/bdmcR5jjYq
         FPVAyvVisyQp0sHRkKYnIMNWvX7wbw5RPb5F7yFwdbm6agUpt9tKNuiTKHY/t52NtiGu
         37kPDK5xai3J3Bh1LJBtmVU7U5R2O4TL40y3W5W0xz5X11R9D862JbeH19CFIGHwN0fP
         i4hQtqHlejc4hrKtKq/qtyk7Cm7OkSQv3PI+1XYo1wytZsIMmom4hN2Brg69ds/KoWBR
         MiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179314; x=1788784114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2jyu9EWq7gK0JjEZiz+ImWml7ed1HDT5ZIEVxolEFw4=;
        b=mdptiiX/dLYmcfPm4+nPXuN25veuZvBAU0Q6jefcNKIzoUemwt+irxPs3h0GMpW5x6
         x2ARF0pv2YIZCdXI23RukqErlnB1TbcEWJYEjoOIYqzgdXbIS7QKiX9NQdEsRnpJYsIP
         qRb9g4R8phbP5vaes3OG/ZrYIN7suXHlPc32AfD1+vmOfjaYvfc2vGwbkLe5Cd1iBnZM
         qyE1YTdaSKk9HaHN7hjnzeHeek4I26Da/vLRGgnIbya8OL8suGUw2+DqGAl0B13WQACk
         cfPg//Mel5oipPhFQN6OqaCZkbE06DvNviXQ/Yo2uNgH404ZJzkeTbUREFnobzlzKXSd
         0xUw==
X-Forwarded-Encrypted: i=1; AKwUvBxh528RBt3cpB5kRlyfQS9yUId9KJYMUXXtRKVIbOzHLflTOygMz50XY1fsY8IqvlgsG9v82RfgX9I9nRNul4A=@lists.linux.dev
X-Gm-Message-State: AFuF++kumzANIXepM/8hexcXmil4k2Ix6f8WqVL7BWAI6rEeTd4uLZdL
	7Vw0l9T4dm0Rhx9iCh6RszT9W/EVZZf7h47Bsc5FBFYvMMcntUY44lq5
X-Gm-Gg: AYBFou2tP+rPFxRyyvoOGYZ/Df4g1WSQy08UzowDvBhsEbSrwSnpD6NryWmcI5vbCak
	DusavhVM7OE6ksbUx+VSmLLJBiOUp2gswoFTZzhLAdiP9t3yRo7+ezyrVqbO9e3J77t8GJaaik8
	g2clmOt84Rr1qxMajQCXRn5ryN82FjtGMaG9rp8B9YoubOL9FNy5zryX779azj4SgdC9aGQp3YG
	WbKEhy2WOqW63E7qtqHH1wpfRAH3JdoNhDqt2JyVJ2Nxr+7NTR9BUJXrrqPyqZIms0d+dYx1Jvo
	3Dlqbyk4XME+DP0LhNe+azsPnmTAlEcaE7n7OXu1/YtfHlYTlTiQT9wrrSbG31jnWfmHklROuXK
	n1NqL0MK0mfT+MZYZ2IlMdnzuv59FrxzWfliXa9D9EcFhgo+GMeN1v2a8UGthUgZg2I/f8dT8ft
	Mtwtg5Jzgv0jEA9iI2OAID/fxAjgzPa6RKmYNoAVlagqHwk00nrQbpHx9WD3B3GvfB
X-Received: by 2002:a17:902:988b:b0:2d9:2b1b:878a with SMTP id d9443c01a7336-2d92b1b8824mr24362505ad.10.1788179313600;
        Mon, 31 Aug 2026 05:28:33 -0700 (PDT)
Received: from celestia ([2402:1980:9c5:2de5:8b4e:3f3c:b637:4ca5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7594fc0a6sm34514055ad.15.2026.08.31.05.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:28:33 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: sashiko-bot@kernel.org
Cc: aethernet65535@gmail.com,
	damon@lists.linux.dev,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] mm/damon/tests/core-kunit: add test for unconditionally skipping the last region
Date: Mon, 31 Aug 2026 20:28:15 +0800
Message-ID: <20260831122842.9091-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831115015.3A53C1F000E9@smtp.kernel.org>
References: <20260831115015.3A53C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 11:50:14 +0000 sashiko-bot@kernel.org wrote:

> commit 7f67629ee782b9649498afa3088f50459bfb8f3b
> Author: Liew Rui Yan <aethernet65535@gmail.com>
> 
> mm/damon/tests/core-kunit: add test for unconditionally skipping the last region
> 
> This commit introduces a KUnit test to verify that the last region is not
> skipped before being processed.
> 
> > diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
> > index 4a536d41cdb2d..90b0fda34fba2 100644
> > --- a/mm/damon/tests/core-kunit.h
> > +++ b/mm/damon/tests/core-kunit.h
> [ ... ]
> > @@ -1632,6 +1632,48 @@ static void damon_test_rand(struct kunit *test)
> >  	}
> >  }
> >  
> > +static void damon_test_last_region_quota_reset(struct kunit *test)
> > +{
> > +	struct damos s = {0};
> > +	struct damon_target *t;
> > +	struct damon_region *r1, *r2;
> > +	unsigned long min_region_sz = 10;
> > +	bool skipped;
> [ ... ]
> > +	s.quota.charge_target_from = t;
> > +	s.quota.charge_addr_from = r1->ar.end;
> > +
> > +	skipped = damos_skip_charged_region(t, r2, &s, min_region_sz);
> > +
> > +	/* 'r2' is not processed, it should not skip */
> > +	KUNIT_EXPECT_EQ(test, skipped, false);
> 
> [Severity: Medium]
> Does this patch omit the fix for the core logic?
> 
> Without an accompanying fix for damos_skip_charged_region() in
> mm/damon/core.c, won't this new test unconditionally fail and break CI?
> 
> Because the underlying bug is not fixed in this patch, the old logic still
> triggers and returns true when it processes the last region:
> 
> mm/damon/core.c:damos_skip_charged_region() {
> 	...
> 	if (quota->charge_target_from) {
> 		if (t != quota->charge_target_from)
> 			return true;
> 		if (r == damon_last_region(t)) {
> 			quota->charge_target_from = NULL;
> 			quota->charge_addr_from = 0;
> 			return true;
> 		}
> 	...
> }

This test is add for [1].  Therefore, this patch can only be merged
after [1] is merged.

[1] https://lore.kernel.org/damon/20260830063159.6347-1-aethernet65535@gmail.com

Best regards,
Rui Yan
