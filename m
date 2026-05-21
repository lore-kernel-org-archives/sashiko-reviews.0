Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F8034A3C4
	for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 15:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779377297; cv=none; b=k7vFQ+9JmSp/7AbYrSzjdESP77b/NfbC09pdS4Bm0bHJnZCH6TP/5NrW+0DMUQtuyndlMoDJhXbCPCbkYSA11sErDDoIya4R99aK33Izx1GaWl8gpynh1RzeICTP8ExoFZ4y4mtw7/42b19iAGcpAdkB0lRuIyB7xF5fqGLrDbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779377297; c=relaxed/simple;
	bh=d1y1aHRjslu84N45+iPQKmW6OS1b2i2WBZc7cYszPaU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GAMWI79r2nGvYqWSv8ZE/q7EwMZnPOzQdXc1aQrmvo3osSmbJztcFbsCQoqtCm/D1T5NvAL38D6w2budP3v0+iJ0XmKOa3xwVuUExnTyHbhaWqYcC5AHLduPf1Ucr37lEhk6j336SEb7gi+o4v/ABQJL2E2TeoGDiwHSUwLRv3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NU9ie3Dm; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NU9ie3Dm"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dcdaf06498so4218520a34.2
        for <sashiko-reviews@lists.linux.dev>; Thu, 21 May 2026 08:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779377295; x=1779982095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d1y1aHRjslu84N45+iPQKmW6OS1b2i2WBZc7cYszPaU=;
        b=NU9ie3Dm1WgLjTNG+4PqJApjCjkOd+AEJEcE1W96qNoAJRqUUUUbCRJJAMCnN2H7Y8
         lkTfqsP/TpeW4+uICMar/ifWfiFRho5+iDyNbi6G8AMUxueLg7tsCrvuQdwEHkpzK0/i
         uj+qW2Q7zDzuOsaEw20TD+GoyhnirQu3SX/W/JaIVKmvvN6qVYyERHw2ncuQ+hI6sF3X
         NYexpkVss+5ck7dfVYdh5gzplXYa30iSzApfPa8dsB13Xl0JrvKyFTIPym21QajLkT7M
         DoYboB5fj2NeBra+poS5NI5U82wLWykKVgwdeEn1k+MYraPyGn5P8pJQFmfqLGCaUOi5
         Qyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779377295; x=1779982095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d1y1aHRjslu84N45+iPQKmW6OS1b2i2WBZc7cYszPaU=;
        b=D4R+4D/3NLa/86sZSha8O0BfCQEC0HcZ877Mf0ZbmZoMszdznMGS9PleixQgyksCF5
         nSWjT4xjthwyvNkcdv+mYHCygQ2V/mgLP6r2JbB7K83tBdAiDVroQcFMos2a7mIItx/L
         pZjD5ONorIsrhHClRTrY15442GCskj3nhTSby1OwKjsxa96hXA//8YHWR5ct2I4FwXFP
         7hbMPs2UAMmZ/L/5nRy2KEzYJ6xHWGLUTG/F571LcUV15PDiPC8qg4t9Z5axF01oOJuy
         AFCrxvRSWfHaaUr3dF29s8g6xwAjex707cjCJ/CEBda9PTcW3TP+/LJr0RDkBu2R//9g
         DXVA==
X-Forwarded-Encrypted: i=1; AFNElJ9XCUi8xHRG87Gkc+7J7cOrFN11kU1HODO2qkjhnKe2ixacKbAzFCQs5w18lJjrSOj8WIsQ+B5CoX4G7m1ieXU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpRjI+0zIe9Y2TLd4etXpmh1B/2Z12CRbnr4UXru4oWIu2QxTe
	ZgqR2WOZsgF+DxL/pNe//rOUHZVx8U9dkGCh2IVO1hg276iMAmoZVKVK
X-Gm-Gg: Acq92OGn/fP9UI67eErzG1LhbbsPSGM8JhMhBttnI+JK2p6ysU7e+d5qSLvK09tER5F
	IAn8Wln+WwENZhS5PR47BP2Oq75BTC1jj8tNUyc05aWomz3k3Nz8hFeLKc0YJORXmMHVz4krRsl
	ok0L7XdY2imRcICLJV5LKO/pwjzBXBtRvOKpC/wKW6HPKECHPiWZU0XyzSXiUi5U5v/MUwCr0zt
	fICL9vA2VVzWhOz5Db54KGjT059XdMeNF7fAeEGREI6/m5KQovM9yaGnav4DSNKg4Q9nOfk+z9M
	adfElxT14ZpvG8w2ovL6lK/ExshR+yhn1DtQAvQfD5QVnqI+/zosufFT+2avxjmL6blPKmVHZcu
	tA7HQ1W1oDlPuHx3uPHirW1tW+V0HbAzrnX/OxI6LU0mMmHctCzN25WOz9ePd3AcLLR21qnKaom
	JTlOaie6iVGWha68PS8qNuYwa7BX7g7hb7DHpMieg=
X-Received: by 2002:a05:6830:d04:b0:7e4:10:c994 with SMTP id 46e09a7af769-7e5ec2a646dmr1826783a34.11.1779377295191;
        Thu, 21 May 2026 08:28:15 -0700 (PDT)
Received: from Dell.attlocal.net ([108.243.219.47])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e5f6e73425sm617527a34.17.2026.05.21.08.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:28:14 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: sashiko-bot@kernel.org
Cc: akash.sukhavasi@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: serial: rs485: remove deprecated .txt binding stub
Date: Thu, 21 May 2026 10:28:13 -0500
Message-ID: <20260521152813.28851-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521151305.186201F000E9@smtp.kernel.org>
References: <20260521151305.186201F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for catching them. Had my regex incorrect.
Will send a v2 with the references updated.

Thanks,
Akash
