Received: from mail-oa2-f15.google.com (mail-oa2-f15.google.com [74.125.231.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1B451476D
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 18:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583562; cv=pass; b=HQAT/nbEcA3Fj3y3XL9HhLZuHjuFglG2e8M2uOy8cYC/PAdeXUN1VG+xsmk73lIw8de0VOd7q/mZkIBfQ+pwAG2kYzl4uFQs7DIgUOfDklc8qSorEZ+2UL/v9NHOTklYejqXulzN+tYDWEQyRd/ssB8SO2QnnFztIAGhePZYWag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583562; c=relaxed/simple;
	bh=bEYZXb/7L/YtOWAVT4ctcRizZUVUDEWDX8/RG8wgZzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QScbXLsEX/S5u9lajb2OV1NYxrnh2pFcB7ZLWXN6LI97RO+/Vn3AmAVmEbhph5LhuggCEbmQmEpJBX3E3G50pMkDR1YA5WX3Cr+HYKlK1t1kVF/CPygS/JflrfEaeI0m48EVuZ9xZUWKcyqijXtg+XDg3q57JE95eO94iuG9UY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O4NGqnSg; arc=pass smtp.client-ip=74.125.231.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O4NGqnSg"
Received: by mail-oa2-f15.google.com with SMTP id 586e51a60fabf-478cbd5b48aso1074841fac.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 11:32:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789583541; cv=none;
        d=google.com; s=arc-20260327;
        b=q7J7pRNd48Ovbr8p3Zlpxj+LnonQV0wmScplDQ1/YQXD0xUv8xkZpp3WLwSljfGM2T
         9jaTC4i9zSeceBPWFOmnRYCCQH4OVGB+opCGb25uLL0TQQfo/YihNZK/Fwks8zUbXYLr
         2yofBQYDkE0zQ+U6QC8M8Rnf8lmy1yLy1t2Lxy9HZ2xO1ohgq7FS7WmvNUczMw5Q5drR
         MXXTvPCijjkPWVA0BFecXQHrsqI093oFAGgcLIJvEJWPKlz5YKQNm/kxzd9J6tSyAwVZ
         eaQ03iEFW5BiCSHy5YVWSt529fiYnHeOMnLRmYKdB47am+Tw0Z8USksV+Lbcq8W+FY3O
         nQuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bEYZXb/7L/YtOWAVT4ctcRizZUVUDEWDX8/RG8wgZzc=;
        fh=eOFVa4hkedo1+InVETRUeCWbagbaXE3Fr8YjGe+aXg8=;
        b=TJQ9o1L0xB9//i1lYmVxub2CC+/TqDo/OS5NPnNheyvUa6bpngqcAfBAjMNP1UyMOT
         i/uSncBtycO5c4f5KE9gidGB6W1EOR2kkBiX3dcvR9+6aivFXnu9OJDp8mWFGrWNkYZ3
         6zWsTMT1ZzMnaqnfPVkTHm0evrd/kPLqPPwbYUgW2aFbxMIdZgxG2PLQyahhmtWb3hG4
         ZxNGsFX27OsO+r2VqHAFK/X5PKVx71bAt1wOyatSxkBEfsIissohErvPGzYDPyDZjZDm
         fmdNZM/4uZZmioSYtKEx1vjHTMN5a1lZHR/uSpI1zePPK/zc2j92MGWsaeflZyDOlosg
         Ojtw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789583541; x=1790188341; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bEYZXb/7L/YtOWAVT4ctcRizZUVUDEWDX8/RG8wgZzc=;
        b=O4NGqnSgGqv8gJhux8IgQ1BPWJ9Yt6aVbofFNod9ETMQcWre76d5WumTeK/W5Ne8dq
         ujjhWg0uBxHAwuTfReFYKQ+kLrMebeaGvOFPHBOq0CTDJpmh7nQT/ZGFAy5YOTfHsuJr
         6qeWvfK7XI0npi5b7jNoJUViXB6L+U1dfrWYN71IThTI35BoRZDul4zIDAmXSVvm9VKT
         LJOq2J8iKmy1rTFSkMnRrWFr4Zqs5qkrJ1fUQpMNQFgpnEjmUFOIAypgtPwwgBsG29Gi
         zZ1aCyG/SVTTNN9+Izk1JW4BRyebP1d4/klKS7RfRojuqGBnPvL/xj6CNthL31SR3Qdu
         SJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583541; x=1790188341;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bEYZXb/7L/YtOWAVT4ctcRizZUVUDEWDX8/RG8wgZzc=;
        b=XIxEqR/LPR9bdVdoP4E4f4NN1zzMMPQQ5xvqlAGAT9dzyKmPGu+L17TnLiNVmfGM15
         4WzxRHHRC7RWwobu3u7ZioDbTEl54cOAoXbQMLcCsbFCIk9MnGfXUG42PtLBoAzEJ/jM
         XPJwdgCYomoFROTXUZadzzrGsXp2k8fBvPVOuhxgkG0seAi+Rz9dT4MyMJGcxKDOZRSB
         mZldllw7FapZd9tlBPy/TGadHqx+jR+S7pTGlbgZLbe5q+58PE5EWP0WHeRlvxS2ugsK
         61bJe0pp+tq3g4KcDOR2Zsl4pMEARq9AgdDQ5Kf47zZ0rjRC9aQ9P/8YbkvRmsimzKvc
         2GOw==
X-Gm-Message-State: AFuF++m+B0kK4dOrUhYYbDABGNtUXueouldqpJ6Xxkgg6Z4AhXaoc08f
	FJWFcrgMAkA230W02OEz23R7R9SJlGIG070AXrOW721Dv+HXhc2tgs1nF5VH4SF+pUqDBagiF73
	zNIFQGDjlolav9IJ1a3gkvTxpvGpbeuE1w5OUO7x5Sc9bJRZy7vlspY8r
X-Gm-Gg: AYBFou3wKH1Dkeqwyp50pgVRphJF97LNR12WnpMhk3OuGcLtO8/drF6z7P2EluXaQBr
	atmcqeztcTaTgZTG/8oByKMUwyHdwCeCrE6+dvkeaq+eVpn4VSeF49eNTLV7PpPPnyNPGmCnYa3
	eiPDpQeUN8qrnGU2Tv/D3MqhuzafN/JY77oAuRWxTQ9kaDaDtPpYDfDX0p+BSwkI7RkgN3W2YA1
	zGh+RbSicJ9vASE/vdAV7FflNt9E3NeaeN2ouXDoH+unG0d1RXujk7P/qJXtS2vpfH/+rVrhoHJ
	7nILVX+2JC40/o1I3Hn338qvM5ngCXOv/Z1d7QOGBb1dTWZ6HPEPKS7RYt2w5B9Uw9M9Pz24P7T
	2R5NYZx/4BwsZ4TpMXJ+cwO64
X-Received: by 2002:a05:6870:9490:b0:434:5c90:9d87 with SMTP id
 586e51a60fabf-48475d862ffmr3569677fac.12.1789583539634; Wed, 16 Sep 2026
 11:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916173203.2555458-1-jbongio@google.com> <20260916174213.832221F000FF@smtp.kernel.org>
In-Reply-To: <20260916174213.832221F000FF@smtp.kernel.org>
From: Jacob Moroni <jmoroni@google.com>
Date: Wed, 16 Sep 2026 14:32:07 -0400
X-Gm-Features: AcwNN1XIDTmzw8R_5GectK79olTXaZFOwnus1SogcYy3Or_QoWrpI-xe7GX8NIk
Message-ID: <CAHYDg1Qk16RM=nbiHSV7AS065CL_H4_WtBmbBHewD+1jM+AAFg@mail.gmail.com>
Subject: Re: [PATCH] RDMA/irdma: Use kvzalloc for lvl2 leafmem allocation
To: sashiko-reviews@lists.linux.dev
Cc: Jeremy Bongio <jbongio@google.com>, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tested-by: Jacob Moroni <jmoroni@google.com>
