Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDB7207E00
	for <sashiko-reviews@lists.linux.dev>; Tue, 15 Sep 2026 06:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789453978; cv=none; b=L2RuPXW1j9bjfuo06fiqTHVnNFmHN3IZOhdVo8wRaz96TaH6szKrEnGQGHLl6zVeGF5/tVqVw6baFpjO5xFYA1lA5odGLNi21g9WIYsEVMSatd4vwBTpWSMxS6ptj4qJjnjYItvwX+SPAVuam5zHZ+U74uHK2pBQkXuzYoskKiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789453978; c=relaxed/simple;
	bh=QqArEvzGbVkfAltQ7Gy444plDqM6Su1k8Ceju0cJ61Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bcXWN05YtObwF69UB4lYH/+61ACXIrVvW5nOSat79+64OeghvrGLg0dYHuwbRk3ycTW6jArNR5/PAMeLEIV0PfbJPi8FaXPl/lLK7Re7jjU/DaVSIgYumEoBihS7I49Dehq87tWaVyDXAw7LiFXggHJXQesJL2xM4SmjtPOBNU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hvDOaJ7M; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hvDOaJ7M"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so2387069a91.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 14 Sep 2026 23:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789453976; x=1790058776; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QqArEvzGbVkfAltQ7Gy444plDqM6Su1k8Ceju0cJ61Q=;
        b=hvDOaJ7MxxDFWeC8jIjrccrzT3dOs5bUDYqRAEyfJhL1kS5mxK4n+HmRd2x1GHfVY3
         2mioZGYo1lv7xILUGC1I9hQu3SdAYkQvSSbZb7kLgXB38x3Y1pCJlQTjLHKVNPoalgka
         cJsUAp/GWfMmQarrnSIiWkXLGKWG56W755Wl7rhbpOdo3SjLVqHEiNof0JZ075Mw5u3a
         CuZACs3uxmm1Vq68FAGhQErYpFmBgUUrsWTp9Ozqnah6xGvu8ybwtobb9mbtx5g25Q2K
         oFJTox7cQuyJOAA92CE3ZM8hfmlpTGPBtXbo+Bql15Ijtm8wSjZx02e3R+z9lMaDJTzP
         AUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789453976; x=1790058776;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QqArEvzGbVkfAltQ7Gy444plDqM6Su1k8Ceju0cJ61Q=;
        b=QqGjbVdEokKwDI9E/5ic6HSUB4cSSTtRQog+wRhmT6qNguWH22M3sVJ5JX2hu67Sxy
         gZGF4IarTlzBX4RNkzQQ0zfMu+ZWEomKJBXVQz3NM47hDiQl4pbamfXvy4XhsHZ76fDc
         sz24BTTBLf5UzEd6pftNG8Jka836BXBtk62EkpLFzxZC09+K9dm5S6YewE3DVmnBWNBJ
         kKl+va7Zbqaso5P8UsM+QGL9vd80Ylv+erlh7HklBVGyv8/+Uig6Il0Dk2Qvaqaw+UPi
         Xxuw9zKigfZmzzmFd+zHcX3DKJRVSIG3eULH+ZPYgJ1Z2YqXUpjCij4SkqKjIXcAw5no
         +c6g==
X-Gm-Message-State: AFuF++lViPY1jD++Pf1/3XVapALgQwMa8IP7CFmRWl3dxYlDsPWIfw/K
	Qpr2pd8pO9f+lIIHXNUPlCbeAuaxPekVwua5PkTvryD5OB+oUDBgKpSP+R2hS9vv
X-Gm-Gg: AYBFou0BV1X5JFdtWQZ7de7dRhSjPfK/y/DxO3eAnGwX6wfJGfdQO/fY4m8D0BCl1DJ
	sVhoGTcKwpOYWd6cq/emMF0Aqux3O/YbdrerriMRI2pF1XJyKHzZ40gsDT2S24EAvgzNmdPVJef
	7UJDw6MzMlEJijRYMUGUdvfjYBHoHZzCasJOT+e3yWTY2YET56hz4SKwObrXE9hegjkfnZ4aJic
	xgaaTkZ3eu3b9/tTGx0UNd8EtEHHvyg2QJXqKLPoPOyFExwbPvyBSok9DwsRKjWq9zEnYue1o69
	yP9MqwVaJkSIh0UCfbCkk/yGIHZhONHvuFZuyaMoA0PfQXnVG0hlWfaJhgXq3cJbJHsKLq7dq9A
	meY0+Dd4WTEm2Wqj/6dh/ehAHJE6rxrJ9PcHF3JJf+MfCWNwi5iKY7tY/gLxOtC0gagxgSuDeZp
	AyoiV4dfqRvvGwEQzoJPY4jqSLR8RrncSK6f+PiiyNES3V9B+VufS2VE42AqV6mHT7RC9SFdEm3
	qdy6f6LxHVq4gifG6gzdtc1HWfn3Xqy2/+YOTvBsgWbmFqoUwVnXh7PXBiMeQQHqTrpCzs0yOdZ
	9snP+B3h632sWMrV8W9vcgnR4U6X6iCJ+oioOQ48HU17qXScFbLoFRNMajGm6hA=
X-Received: by 2002:a17:90b:4b10:b0:39d:e54c:a28a with SMTP id 98e67ed59e1d1-39debf9b35dmr11228325a91.8.1789453976485;
        Mon, 14 Sep 2026 23:32:56 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfd9baad9sm3254695a91.4.2026.09.14.23.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 23:32:56 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: unlock shmem folios after skipped writeback
Date: Tue, 15 Sep 2026 14:32:53 +0800
Message-ID: <20260915063253.2471499-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914111511.648711F000FF@smtp.kernel.org>
References: <20260914105606.3997649-1-matthias.goergens@gmail.com> <20260914111511.648711F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Yes, the budget should use the supplied object size. The current limit
is a separate regression from
776a853a43c9 ("i915: Use writeback_iter()"). The old loop walked
size >> PAGE_SHIFT pages; the iterator now honours the pre-existing
SWAP_CLUSTER_MAX budget, leaving size unused.

The reclaim-accounting consequence needs some qualification, though.
Before optional writeback, i915 drops its references to the whole object's
pages and clears mapping unevictability. The remaining pages can be
reclaimed by the MM. The shrinker also counts the object when writeback
isn't requested, so that count doesn't mean every page reached swap.

I have sent a separate patch [1], "drm/i915: size shmem writeback budget
to the object", using an object-sized nr_to_write budget to restore the
previous writeback scope. It remains best-effort.
I have not measured the effect of the current limit on reclaim latency
or OOM.

[1] https://lore.kernel.org/all/20260915062924.2410550-1-matthias.goergens@gmail.com/
