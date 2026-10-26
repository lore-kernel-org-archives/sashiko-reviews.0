Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793016122;
	b=v0tefZi9cJQcFz/nUAfzi79pMtV8ojWjb9tu6JESbMkT7jWkDS/CwGY4+Hke79mRSz6D
	 LgEvnsJcAvsjutLhJBgy+ttdI1K/2FnjTT1QATiAIMt7aQLlqQ4ruQNVs5YaYV/TQdltL
	 srZAwL+fIAyhB2ZPjx8dzNjuC5VaY1LiAZxzEqPhFy3xnRLvxMDdeJRzurPc/Xyk4qxBs
	 dIOi0tiDjSx3oo94b8wwOIOq/KmmJWs5hDscpUoQyaKrrjsjMyFW6O5FevIayJMCwph3H
	 QGobQN3YRZkwsXKYWkk9+lrXzG2BNOX/wzcy0/Ee5qtEn0ReZjqPA8BQEkOFCoQRg1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=9JFC6LuG7YF0CeRN8iSSPvCak5V2ejw9gPNztgjVZ98=;
	b=Ncb2+TVj82WPbf6nUjTlE4+50S777ii2c8u3lD13lb1J5qEYI3MeEHW56dLCrdkJKK3u
	 BY+L5wMWgLIDF6rU8fQYE0GeRkwkWLvGsgB6ATwLFGL/KbxQ1phn/ADtyBDIdpIIQWCjB
	 9SaDKsS72acHEwdkB4BVZ/ESiyJE7QvZ0njOzok2P8V/jBmPWhO/zZUkW6PeaBSjNwr6J
	 DBR61RUj3vR6SMxlmpKU/OyOw1nHZlF0GPi/HcWayS26ugdFvuk39omk7u7qsp5lJQX0X
	 FHNJk1HdVXOL6UZJGJI8iSO/HhHF7CIqi/0sxRaPXlXCOWkIaJRTUOFQEzRr+FNIORw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VFSnF65M;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1378C60A2609
	for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 12:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1378C60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=VFSnF65M
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6d7e06dbcccso1674761eaf.3
        for <sashiko-reviews@lists.linux.dev>; Mon, 26 Oct 2026 05:02:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793016121; cv=none;
        d=google.com; s=arc-20260327;
        b=n8jyuBTRK1AdOu1p8Ov8ve+jrtBv869+VTds181f7NE+AwTtslcrVFFVjzC+QbgvEk
         0VC20BD9+gprAZA3fHbepMFld1Q4Vyzrw7Ga8zcg0lFOQWSo5eeHveyVDCdkCHVntlQt
         Y4L8aCmFrVYOzgS6SPU7FjOzMJPdsTJpgnSnx35AoiXpPSXcfIguEHHAt6bN38xvrBf4
         7RX0F7FbDmiu6RLoi5QzfaW+ZXbGWIac64GPtDlAMCQEZE8wbyCFQBtPH3rTDSfOcZGU
         l0rjUA4GESmbhuchj/BksnJMhGWC5xrKdyK/Vdc0af2h22rLzCVx5zoH4nvHMbD6OX6P
         Ikdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9JFC6LuG7YF0CeRN8iSSPvCak5V2ejw9gPNztgjVZ98=;
        fh=lrYLDXK9IrTWNi9UaHSEVGvI3LAPM9D+2VALLFNJNkw=;
        b=YQIYsyPIAaiBYVr8ewUETDdSz4tMdfiFqLkKnppeIvyUa/qqE6F+R15iOggcSPX2bh
         WVktGr+E9XMCFd555IfI9zDyaqnjT93kYyMiMaPj55FNl1nsW/PQTl9+SQNDANb9vDaK
         gUYnU3ZCdW+QlG4o5UIKBeG767OPaSl05K9MiH1ayUJiHZznKpPYcEO8BdhKmYDFakSz
         wGDrOG84Tbcbxye+oJO/DiiHiw4JVYQu8BYcQl6A3pWIsQVWjPNVeDWJaWrTasmh5XfD
         e2gGq5YZzv5sCJuq0KbDmSfQp6T9Qh4UBjlSUo3Y3OFnVh2VNsU6XAHtwTUsBdeuo1o9
         zxyA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793016121; x=1793620921; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9JFC6LuG7YF0CeRN8iSSPvCak5V2ejw9gPNztgjVZ98=;
        b=VFSnF65MUz+anJtxMk8Jq/6i6HF1iOHUqsegWIdmuoMAM43zm5gU+9lL4oAtdI6fMr
         hc+bsvSo440577OEZd0reAQcShN9LJ+XiHITd4zijPxBCCevNxRFH5wzx+5iy79GCCV3
         gq44kOqyVgvKuHjGkIxS2906jnPm3XGcIUMa7DELKDqxobetdQfjQU6Kxv7ADdxKamx+
         AtepYFjnaQERg03Q4ox5sWrjsRQ3K7GmDfbw8CIvQHoHBuDdT3fgp0hMb/lxM8xkdJtE
         qI3waTy0sgJlKiP6KqfKZqI2181cMEKg/YUi5X+AcsYQAVFwpVvvl22L/P2CrXxZJxzA
         TL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793016121; x=1793620921;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9JFC6LuG7YF0CeRN8iSSPvCak5V2ejw9gPNztgjVZ98=;
        b=CzIcA+49T/D1RE5y2zzdz7yP4CL+hnQ0+8rJ/ORvG+6BZp7bIhpqltXnfJrFzO5g4e
         v03prtguov9rjJ+EZwiIK0hx9Fgt6NhdqPnATCf2Q0C343pv9j4vcL33JaHFoIPyXByA
         NTT+7BDaE8qXX+Yt48GsfCh2Vjc7iwEFFA5FFd+nLoSxv+szwMS51YJN8yIdpo9aru3p
         /HcV0mmSG1nJudjTyxvM//Pto0Mn58k6YDKflE71nr3+xmlmu33IGq2IcM3+o2mPuSOg
         e5sDD+TyL2vnkB8jcFTI/2Sc375EzVoUwFF+TBCaUdkLfIi6hTwla0d0rFKz1l+5TrUZ
         3vhA==
X-Gm-Message-State: AFq9FYKUNMD9dOh5UBxNV4sbYfvh6IYClC4AfgFGrGT6Cv16AcrGXuP2
	u1/h7J6BFFYfhhpczJrtMQI7i3npfwmtghBzXNO2KwJ3s9gWitxT/i74l1n9hB5IJp/m36TRZcF
	jfAeexMXMyoIVA6EfQPHtrUYQh5PJIQkQKaJcYCX2
X-Gm-Gg: AYBFou1zAE+CVfkAX1JhxhWkPW0WXyIW3kRXXBGJS86FnTWwG9m1uiTMK/rvYwAxyzl
	/GkeqaH7Ekhn8b+LbHjXzMpKcd3Gumafng5OrdNEwFtR4b3gJOBrJCzXcyD9glRhY4tkj0BMV+D
	0lN6AZWhO48yt1HgW6Hh6dt83vbkBPrhGEnS3X9f7ZHtOVNCvcO40WIO/HKdng5c1omdZCKJ67y
	C0rjfAWVLqmBeibfwa5RZPA1eJ05Qaqy9RmANZqGn7rsdtGvcdNkCjioLAyEZrj8/KrVNILfrQs
	LKb6icXIRu/w8HJvMLZruNkd7w2vXNMy1XIxzBv+0596LoOoA+IZiySZqRX9n488EotshzMBdtD
	NceRiKz/ibhglYi+CKuXdbBoWfYmTonCgSk1uNxD1XluLHb/VaQWvAdF3I2Ln9rzlSqa3OiDfBp
	YzWEmoUilKIOjJoGtufXwbwVDEqnmVlROjczs4swE=
X-Received: by 2002:a05:6820:55c5:20b0:709:a86c:7c58 with SMTP id
 006d021491bc7-70ba0e4cf8bmr2185587eaf.49.1793016120389; Mon, 26 Oct 2026
 05:02:00 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016202909.1289496-1-dhu@x6u.co> <20261016202909.1289496-4-dhu@x6u.co>
 <sashiko-outbox-174922@kernel.org> <CABdL-LTgFTwJPTD0vyScNsvCSAW_04TgOyO1swVBgHxDcmJsfg@mail.gmail.com>
In-Reply-To: <CABdL-LTgFTwJPTD0vyScNsvCSAW_04TgOyO1swVBgHxDcmJsfg@mail.gmail.com>
From: Jacob Moroni <jmoroni@google.com>
Date: Mon, 26 Oct 2026 08:01:48 -0400
X-Gm-Features: AclHuK86qSs7gFXUSh_t11KPVJZZWI0qSyRrGNFPLSDbHhWXQ4pP7y3mUrzZgOo
Message-ID: <CAHYDg1QGH=GwAB-acW_oj3DJdSZBPidv9Xxn+n9=RT9Ss2PC1Q@mail.gmail.com>
Subject: Re: [PATCH rdma-next v3 3/6] RDMA/irdma: Support UMEM attribute for
 QP creation
To: David Hu <dhu@x6u.co>
Cc: sashiko-reviews@lists.linux.dev, linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi David,

Looks good in general, but since this IRDMA driver is used with iWARP
NICs today,
can you double check this Sashiko finding? Maybe this newer path can be rejected
for iWARP NIC types at first? Or if there's a way to make this new path work for
iWARP, even better. I am not sure if there's some generic way to map the generic
umem for CPU access that works even for dmabufs?

Also, could you provide a bit of detail on how this new design ensures forward
and backward compatibility across new rdma-core, old kernel, iWARP vs RoCEv2
modes, etc.?

Thanks,
Jake
