Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931052;
	b=Pnh6kZ/W+OmChWWPsLMjjROb5bmNgvriMz1pstQm3KocvndEtYp5jRsRc84jQp4cWZ84
	 qyBM+KTDQK043v+4/6mjXNXuATuQg0wHU8YJd+OOStVRayQqpzK95u3BBTuhofdELg8Iy
	 QHAAOkDNrlBguGkWbKqETy6G6HxLrZ4HVEEYza4zZP2rDALUY5LRLR4SlhooO9KpFfKIO
	 Qgn3iEhsIWCphdhKNrjMxJHgIkhWxk6ky0YjfPX13u8wr9OQay6zTS4BEwN8uawKwCqav
	 h2yRQ3atJVHEuN/NukQ8gIUJIv4CPpdkug6p2065RsGK6inVfAcJPq38LXw2RY+0sGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:Date:
	 Message-Id:To:Cc:In-Reply-To:References:X-Mailer;
	bh=3+FyKPryUnxHupmwOSIIYdOL35FcAHgGEhz0DKQNfhY=;
	b=b9zJZd7V7jmQaG1DO2qxQVLLxSMrAM6NyFlGsLgh2yR7lFnW7GoT/dvl1xa7Ve+hX782
	 rrEQrR5RwxOBxG2pODbnEnmv3dIyeZtDihvL/Ze+xLCwm7pE2bDKi842GPTkjSM65LkY6
	 Bu6YDPObGdyPE/W3FU1WcIrOmTkbjyXCfBMbIKX/kHWetutz9w0Y/9RWnCRJzlA6FC3gv
	 ZVunYJJzsJwQbn9CRvjcaWAAj/tDbGW+sa3qDfZUJruSwP2Eqd26vVxYtJJMikCR/HptR
	 L/QithhHmT1lkuI2WV067PTiPP7W+Zh2p7hyM7ABLsRYS+j8mhHXmCKybkHpOF9ht7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZjB+ths;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E45E606A330
	for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 15:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E45E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nZjB+ths
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b18c01238eso1530253a91.1
        for <sashiko-reviews@lists.linux.dev>; Tue, 17 Nov 2026 07:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794931052; x=1795535852; darn=lists.linux.dev;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3+FyKPryUnxHupmwOSIIYdOL35FcAHgGEhz0DKQNfhY=;
        b=nZjB+ths7eznB2UU7XZ4qPBh+nTw7rUi1WODAe7DvyunmNIVB2Hqteb1QhmCqDFjn4
         cw9y95/wkvyFjVm4ImCXn+1XecBZSap+waJMBjp1o9EIRrV/oy/qWmFLjfhlHzwjaOkX
         TrXTiT+yiUBUpkeEwcZy3QjMQjZhg0azn4SYNTHUQqtFtkganKl8W8Mt8xkFIgUQEpvL
         BvECECvPGOemSqAAjbG3O71czIunQ6M1s7syjde+3CYihJvWUGWT5UL4chj3vobkiBj3
         qfvF8GDLysk4C/oD09gj5iIAphv7iPChUKgqZ5khCMrVbIDPKxewvvTzPGM38fxu1izI
         88hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794931052; x=1795535852;
        h=references:in-reply-to:cc:to:message-id:date:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3+FyKPryUnxHupmwOSIIYdOL35FcAHgGEhz0DKQNfhY=;
        b=eIctKI5WJu5zDbNUDq2XfoH392DlmICAAEaN0zBXWwLBMx9N8NBByGVa71ffRyjW1g
         nyZz+SAkiDqctkuKsY1+ePjm4ZRwo8mkfEDadZcttSPKqWIUS8J/cQVJxmKX+i1ZZ2XJ
         zSjP3yJM9+4bsQHt7S4uOgkQ2SNfV+m4vBaLnpvb6fILsO7jQhGra47gcVUUl0yjlBQC
         DEel/TAOFhyHk7mY7Q+/JoEgd1ncX7SDLNn8z/yhCtHRuAzTPL8bxMijcdgQQUK21dd0
         sJ1Rzur0woNoyOmogG0DbFtTDscokYqcWbP4TtF88Mvf3+19+edNer28o2H/XqOjklKX
         ekfQ==
X-Forwarded-Encrypted: i=1; AL+hErHpiz4ZDxpezKFe1QAelHYwErv5DjvY4P9xdroNw7oPKApXQHS5TtrqT7H5X8B33DsZbzZvJzt9J3wnCetrVC4=@lists.linux.dev
X-Gm-Message-State: APuU4Z9YPd8mFCah4QMJyU/6AcSzc4P+G6JgW/N38Ys2Logc559WWn8F
	cE0h5BpBHFeN4YpnXHm4FDRr8zyanfU/MD+tqOJsunE+ZSQmDzXE3phN
X-Gm-Gg: AZFdTZfOQCacl1uchIPKZZhnrz6nJV1znVK5vIp/kCUlUI0NgReEuAdu308mauUyarv
	qcwtbnOoAosA+5J42K5RXeaMEVJJncYu8GprMX/xYJZ5TYEF1UNh0+E/R3J0pZ1GqoPMRIqaa6A
	wdRaB7xezfvhE42YsGE17Us0b0TlgMumTj1u2U9x7OwGarS81EuFVOrjs8wAPMEjfa5vqqVmQRV
	wGb4x8t51khYjQPRFkZ+A6JN1KvgI04MlgIJ50T1ZOjS9fm732sVVbDOJf+ySGUpLiQTXJlProP
	GMlAE4EeKmVLubJ8QIJjEM1nrbsydM36ZX+hFuZC/8AWf8PwELA+S/7zWwO8T5wfpPl/xdrXlQx
	m1EhTBM+KxpLx8W7uDSfbSuIOSh9SISF5ZhIcVgK6KXNiptM0SL/ASiKnY52DlZvMw5BKLfDD0C
	FvWvGyHDtPpV0ZbjkfC5gfcxIsdLfINct6DDuHU41dtrnUWIkQEfyPznIVyvJ7ITIMRqK2sMPu6
	/CZDs0jzU7LKLCT5pHi/OSHG5nBdlqExcdUE8VRDql5BOYAxkA1LL1fYZrXSWxBxM2dtE2ajwR4
	9UlwXuIn8CEbpWOc77jq7Aihg0/UGP7K/RfUOIFUw13rf4vbO1x1SsVbnQXhAIaWot0OUYc0u0g
	Z9Z2vhGyXCQEX8gJavcqS5cRnu9YCHoUmOgAycwjhWo8tW0ddLjk+TizXTVo1CZAkNc5AzmrD7p
	+cU2myVQ0=
X-Received: by 2002:a17:90b:50d0:b0:3b3:b750:d2ed with SMTP id 98e67ed59e1d1-3b3b750d6acmr2306459a91.8.1794931051401;
        Tue, 17 Nov 2026 07:57:31 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac6016c3sm4692320a91.15.2026.11.17.07.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:57:30 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] mm/damon/paddr: skip hugetlb folios as a whole in
 pageout
From: Aveline Noir <jm5905938@gmail.com>
Date: Wed, 18 Nov 2026 02:54:30 +1100
Message-Id: <179493087012.57245.993362683540368479.b4-reply@b4>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, damon@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev
In-Reply-To: <20261117143352.121497-1-sj@kernel.org>
References: <20261117-fix-damon-hugetlb-pageout-20261117-v1-1-054ef8760a92@gmail.com>
 <20261117143352.121497-1-sj@kernel.org>
X-Mailer: b4 0.16.0

Hi SJ,

On Tue, 17 Nov 2026 06:33:51 -0800 SJ Park wrote:

> > +		if (folio && !folio_test_lru(folio) && folio_test_hugetlb(folio))
>
> Why do we need both !folio_test_lru() and folio_test_hugetlb() here?  Could
> hugetlb folio in lru list exist?  Could folios not in lru list be reclaimed?

Yeah, you're right.  Neither is possible, so the hugetlb check is
redundant.

> Would only !folio_test_lru() suffice?  If so, the patch subject and
> description may also better to be updated.

That'll be better. Thanks for your help :) I'll fix it in v2.

Thanks,
Aveline Noir
