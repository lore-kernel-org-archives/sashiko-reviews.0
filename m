Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792989845;
	b=2FtPcJwuBUmeqp8FZa7uDDW1TARvjh+ULSp3aRrWirrUBiCHyXErWfYPlsvTJQjHVbjN
	 3P3mZafX+Eoxln8U+VYk/bwaBVdpWC1oZd6jZIFMXHiYIkyPmZ6xpqzT67KXAhxh3PTW7
	 cPM6TxC+5xJfXL0q1vNmk8Fd800J+Vza1qBWN6NqswkjgAEgFCw5CrlF/ZQI7/NmRZ059
	 6CUnKGJnSiF8EKfNvZuOFrk7wv64txzRzjPK/afS/aS4bPF4LgKo9GIvqOEOJ+1cgFeG8
	 T/s78L/F84br8OGCpigo9SDkm/TnxeDYsRQzKbEbnqPhRkjfazW9PDAJLSIO1+bOd/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792989845;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OGQ2n/YSypFFKpyFH0GD8CI4jI6BmXLzQ8gJjPjmUbI=;
	b=T/AcOut3sXiz3vKv30c/x5aUi1PlkltHrzg7fLOS7EMs0GS5vddKV+9SJOhjR8jJgbJK
	 y/I2b+Mg5Xr8e+50iTTJLX6T2fqIwMZxjAiXe0hDs+GytAuv9rKrjSPJfJIvbx/16PR+O
	 UEH1IvFW990aAWhwPJCbowjS4bbRnMU4IeCa33mIcF//aD59CVJrkd0oCpZLRVRAcUjcN
	 x7aaXOk1ssMqh2LHxg9bQ8fUebAvsVZh3vZvSs4o6tpcEUl7DKjH24bc4U0dMN8TYWcy0
	 chNc9IK+mWYJ2WNhL3LqByccDdBuXczCagS2qwAXzi10NcL64Sy2xWpZ1O8eQZTycNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Rq+byQVA;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32311606A31A
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 04:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32311606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Rq+byQVA
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc758830601so1528867a12.2
        for <sashiko-reviews@lists.linux.dev>; Sun, 25 Oct 2026 21:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792989838; x=1793594638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGQ2n/YSypFFKpyFH0GD8CI4jI6BmXLzQ8gJjPjmUbI=;
        b=Rq+byQVAe076n2yzXHKboyRjzhe0jO7GxQH13vpZcDaBcdqr9Rh9WOxon16TBoYP7p
         EiXXKVFDyVgqApIuPqVA8YbuvD/jEmBLZroOMMZoOl3K8mv+jWvTvnZUgerksckyNMuh
         XvYKJKWuB+TZzvSVk5ox7alYHrAx5w57dnI5fILQn0Z55H+bysErPZ06JUm1pnzDK3jv
         vjwPvTSMuZ8Z1bzKpuf6Hz23yeIvvSUvpKlSq/abxusXkkKHeDk/A59nD4HbUrr0lcfd
         5Opu+c/j41/FOE5LUdTU9k3Rp538093QPfpKDh7rOqBFEawIGv1ydOZS2VInpbe006n9
         /4gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792989838; x=1793594638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGQ2n/YSypFFKpyFH0GD8CI4jI6BmXLzQ8gJjPjmUbI=;
        b=jbFjIIdyp9Jl1ecSKzoB+USwo/uSa82xz6gobCN/VxKUMES2rXK0FN+rT86PQJEjUa
         G8ROP47GNcshjcWoCSbvysL7RlSNJI7tiAGigG7gQM6lN6wHWPKEOEHJX8pLklLxX1Qn
         TJTkN+AvGbrN+2bBM0CBYvyIW+tl0LojOAHKlDMrwZ7/Fg0Lo6yV2W2Bc81uN9APSBPW
         8BQ+QaUqWcJwSePb7iI3sUgRu1OpHbNLNka0InZKUfT8egeHq4DUQOYqmRE11wSvVSFL
         jpHPrVnoccQy4QO6KTfvF4DSvD3Vkdk7uUUFxEvjbOO6GXJkFFqXemOxeJuNEQlCPrzi
         lJZg==
X-Gm-Message-State: AFq9FYJlaEH+EOe3CfpYIfk/+o5Dm8UzdtFueO/Y2xIX8BSG6mwOVX80
	wj33Q7JTBu13LCNq6XhNhCjtGhvAlFwnM3bvJ8nDnwJw5nk0JVvmNjKFbgxmWNrBTrcxOqGb5sk
	xOyQO
X-Gm-Gg: AYBFou2BirbNnDdwFmDiPRuE+bdIlbT7iywxWo257umH33FYBOfNshn0gbMEYipuGLV
	4gWWmxTTT83/d3sNzKXZ0lU/7NE6ePgQi5zYn3IkwnR1h+4dMFr6oi4MmkFSOayZASfA+8b3h0m
	cwR0CtLFNYHjGuRBiCm6DtqUzv+uIrn89DT8L+uZ2/iRAtFfaAHO09tddQINpKVGf7pHd/0YyAc
	dF/KfcRViFb3Y/TBizVTves8p+xslnAirPLmB7CVxNFevPnsmmD+hXAXdJI+n1va2WA7NB97tQ/
	syDOflZmvFKBU5oJIiihFAshCahVMQokEhXB8n0KrY0Z3XFNROYXTo6wIvSmd7cHDpcoxnJ5abh
	U/aewP6iGPsAAfMLrqPup2fyt1620vtKaoGmQMP2xVFdp0dhWfjgxetjW3KF9CGGcFu4EdTvumF
	MQF9VRG0foPiLyLMQiQEjpjKclQQsFut01PMQ8+SpgX/8kbN12TrUWSMZ+hzYNEJgHwFCGDpuCH
	LdWsstRRpwhKyARq7J/OrHWR/1NSAoLhKdt/UBUaixnl9qCMNsXEs0r44qegIw9KZf/qhzS7LqC
	xv9JBcIxlJbC6Gr++MVyl493j/lcfLDFbTCOKvYz4ofnViQt
X-Received: by 2002:a17:90b:50cb:b0:3ad:a462:f07f with SMTP id 98e67ed59e1d1-3adeae7796emr4934481a91.45.1792989838351;
        Sun, 25 Oct 2026 21:43:58 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaca7casm6810650a91.4.2026.10.25.21.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 21:43:58 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: Re: [PATCH] IB/isert: set ISER_CONN_DOWN only after the connection has been released
Date: Mon, 26 Oct 2026 13:43:36 +0900
Message-ID: <20261026044336.228447-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-184560@kernel.org>
References: <20261026000733.4178856-1-yhlee@isslab.korea.ac.kr> <sashiko-outbox-184560@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. Both are real. v2 drops the rem_wait wait entirely
and tears the connections down from an ib_client removal callback, so
neither the use-after-free nor the handler_mutex deadlock can happen:

  https://lore.kernel.org/linux-rdma/20261026041949.225619-1-yhlee@isslab.korea.ac.kr/
