Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DC830C35C
	for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 22:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779144801; cv=none; b=og5UUDsHqrlSF+UA5oYQc8Grdr5zY6d8HankraHyMfU0J8MVhPMVufAErF9cJE8kWNrB7okZBZc64C6PDK1TAIpq3/IjWVi2FTojxO0tAcLkLa5LNZvu1ipY7S1FTE17+2UomjZkq67pQuC0yfPYqUk/un7O4pmHmAD4K+ZLNd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779144801; c=relaxed/simple;
	bh=LRCn80kM8HBzYaSZlDk72UNrNNqLYgqVin8TWWYQOGw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eIqmk9Qe6a8uS17MESHUu7uGIqN7lleNYfgnFo/wB1/gMS/c+WcxAEbvZde+5i8zsH/kRXP7Ggy+ZJlB58hVS8i1TzF1fb/Oi28feNbfXdP1IMWFkbhlF17In4iOZv8XOmq5imB2wE5t+4zMLY/DJ5YKFpER2g7YekeM7FYZOR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJwWyCM5; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJwWyCM5"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7dcdd23fcdfso1530411a34.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 18 May 2026 15:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779144799; x=1779749599; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRCn80kM8HBzYaSZlDk72UNrNNqLYgqVin8TWWYQOGw=;
        b=IJwWyCM55XoRj2ttX6U+FWJDD2o5d3I/EqFvV7uyUYYz1QByF1ScUvc77Yq0+yHyUj
         g3EDRcKB2bICZuI5nWFY53n7c0ALrXhEkHj0bt3Oy1nQV0bNFqO/CyLR5ZhVHdlkymCA
         cCgfD7YmbBEAN0qrnG+XVSLpY5eWqsyWw5HfzN7Q1BN2dl/UCsnG5dYs0ZE4WhLwnHyO
         7UZAK9FRcpe/hpFWFnSThEbadKVyIk+du7rnbWUZ+8DrXHbhV7st3/oUD04II1ELTvhd
         s9508a6NvMyf6vICxhpSyTY+44/HRrg+0P2R5PLFViQyFGB2sRxsNjBPQiSp8BsPpQkQ
         sfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779144799; x=1779749599;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LRCn80kM8HBzYaSZlDk72UNrNNqLYgqVin8TWWYQOGw=;
        b=i5ouzAt4hPIwbBPTQeq3UD9Idqh6TgTr1vDg9iMapbqXEdO8kYYdhpVxBfjw5DlxBl
         2g/1X2PzEDe4wVYxkUQ2aS22nbyPii+VXOwy2tMD8YWMl0kWgVINSLu4HVM21/JDAnJp
         UygBovaJWP7sCHuw0O6KF1ORKV0bCJipFfqmx/I4tSSvbgE8LGCbT0Bi2eAZ8qS0FdK8
         NtFT/rvdp29RcPT6/yokBw64UVtBO68GgLeFnjMKsp0uSEw4PgM1I8RVSCYb2XbEjwt6
         uV5o8L2z3Cy2YWFxK1DwzsMSIGP53efzNRyTgzlxLwr4ZZqyvBEsjJoyzWtPodvbLRjF
         th/A==
X-Forwarded-Encrypted: i=1; AFNElJ8nY5snctUmdU06uOLvTgRkrLJ24pFo5dK+qrJOEa2DPh1AzJ7QUeDumOlhN5ZZ8Oc9Pbg1I7g2y1s6RnyWqNo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzccqdYnrwrztI0hfb5JUejNmg19vgPuSfILIbdrrQQKHBi6dnB
	TQkMwlpdYeL6wF73zkrWZ0eyS+6twMEPu04pYMX9tP2SWixaxnf/zdX+
X-Gm-Gg: Acq92OFw2QfVqaU5gYM8k3k85cYUflWzOeCnGZ3wKgQ1r1vrM492b4SkIWGn4fhTq+i
	tsOi9we/RaJTW8wHaBgErhmBuNEQqhHw+wmAY82XiUPrP3L5t6j2CRB2OheFu60sW065Cd59CBm
	hH+Rq0He1ykkD4rjbeQwyKhtp30oVYB188o9QTEWRoncKWTmmcGBMkP/PB7bWMeae6kHeJ4/NlV
	AxWqzARlqmFnprNXSIxDChtx4kZtUZ6Y4UONb7lLp3SM9A8Vy4RAM9q1P5ooDyN/K0St7z2ysYm
	rkuLWAeJEWiLUEqcclRYV0CO7ixI/MxMm98AlHM29xWEs9OkgzC/f3+OBWZ4md7mwqV7ORjk1EM
	5pzGFW5lGA+TzGLejMW61cWm87fjpm04+wavcgr49v7Aj3s1MFjeKWa5MaLguZJDT1974cohadD
	QkNeCkmI7Cj0hHMGVtKQ2k/4IQrn0RoAxOc+Anv8GpEMDc6Azy4DtlbjMwXxDkCUP+
X-Received: by 2002:a05:6830:2117:b0:7d7:da05:f2d2 with SMTP id 46e09a7af769-7e4f2b3dfc9mr12303565a34.16.1779144799071;
        Mon, 18 May 2026 15:53:19 -0700 (PDT)
Received: from Dell.cheetah-searobin.ts.net ([108.243.219.47])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55bbd0be3sm8668776a34.15.2026.05.18.15.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:53:18 -0700 (PDT)
From: Akash Sukhavasi <akash.sukhavasi@gmail.com>
To: sashiko-bot@kernel.org
Cc: akash.sukhavasi@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: richtek,rt1711h: add missing 'port' property
Date: Mon, 18 May 2026 17:53:17 -0500
Message-ID: <20260518225317.53138-1-akash.sukhavasi@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518164403.C09F1C2BCB7@smtp.kernel.org>
References: <20260518164403.C09F1C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Is this comparison to realtek,rts5411.yaml accurate? The RTS5411 is a USB
> hub that physically routes data, while the RT1711H is a Type-C Port
> Controller (TCPC).

Fair point, rts5411 is a hub, not a TCPC. A better precedent is
qcom,pmic-typec.yaml, which is also a Type-C controller and uses the
same pattern: a top-level port for role-switch signaling as a sibling
of the connector node.

> Since the RT1711H is a TCPC, should this role switch endpoint logically
> belong to the physical port inside the connector child node instead?

The top level port describes a control-plane connection (role switch
signaling from the TCPC to the USB controller), which is distinct from
the data-path connections inside the connector. This separation is used
by qcom,pmic-typec.yaml, and on the controller side by
snps,dwc3-common.yaml, dwc2.yaml, and chipidea,usb2-common.yaml.

> According to the standard bindings in connector/usb-connector.yaml, the
> connection to the USB role switch is typically represented inside the
> usb-c-connector child node.

The connector ports describe physical data paths (HS, SS, alt-mode).
The top-level port describes role-switch signaling between the TCPC
device and the USB controller. Both patterns exist in-tree across
multiple bindings.

> The Linux TCPM core also appears to expect the standard layout, as
> tcpci.c initializes tcpc->fwnode to the connector child node, and tcpm.c
> attempts fwnode_usb_role_switch_get(tcpc->fwnode) first.

The TCPM core handles both layouts. Multiple in-tree bindings and
their corresponding DTS files already rely on the top-level port
pattern.

> Would it be more appropriate to update hi3660-hikey960.dts to move the
> port into the connector subnode rather than changing the schema to allow
> it at the top level?

No. The top-level port layout is an established pattern, not an
anomaly in this one DTS. Moving it would be a functional change to a
6-year-old in-tree DTS (commit 47e2843f5e2e, 2020), and the schema
should describe what exists in-tree.
