Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4DC535FA9
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 10:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074415; cv=none; b=jQEUmWCjDEyvIdP/uR2rthS9SUAvCqAUobqi73wG2nH56S8VZ+hPW58orhsI3ATgoyngGY53vVhZGTY90hojPM3WS3+UoPDRasQcyjdzZLif7vNWnwllDQuLq73VwQQ3dHJha8xQFqH0xAKNftmWar29cRIUvxBdVRUxBdyfrTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074415; c=relaxed/simple;
	bh=mdCpsV3oeBbM/txrF6zviMQFbYf9Gv0D67sVl5aM3Fk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KWcazgHVDOzywq7ycs6478l0H31oiwBQORMfI1qQzXVhMniyQpaQqKp601TIisI1lW6coKpB07ne0Q1kn3DOELQC8dxTfjzcUxNA25wn0yWO2qvFcqx2XIUE1AyNLL65AsFH1bG0InM/B8pF8/WAv7QAjxgpWEpPE/J3ZqOPjNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jT8JcxCS; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jT8JcxCS"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-86868f7707dso2176511b3a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 03:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790074411; x=1790679211; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdCpsV3oeBbM/txrF6zviMQFbYf9Gv0D67sVl5aM3Fk=;
        b=jT8JcxCSe7IJGbDRZK+nmbHjsKL1yCEN5y5NpZ8cQzneRUq2RuAdzrNxVGG8prE1dD
         sIYqnFfomMk/s4R/79N2JXOWZbdok/TGJlp48QXtmR7KbK+1VoMAqlpcVJT+sD3S4LPh
         P7d/jm6Tpt9dUk1ZXF3Wp69gXIvMrGiFVjIpL0XYb1HbjAY8c3nZVln+/YZX764J71oz
         biArKXet6DS7cQH1npiAmWeHZEhyOEoOrafY9GdNmCyOz8IXlpTePDRbka4Y7X3tuIM/
         iQZ2a9JOD8oWdDL+KqvMpoApkiGo2sfcOgWMmG03KF9f8ErDo5idx/J5hfWOKPU8qazY
         stKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074411; x=1790679211;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdCpsV3oeBbM/txrF6zviMQFbYf9Gv0D67sVl5aM3Fk=;
        b=MJb4cPy4gScUsROkNU0ti7NjJxUCFB58aLEt8jCCViytx+6BD53upK1iSNp0MbCsx0
         BbQQTfCAkae6KlbvZydmjg/qrK6FtQa+B2y/1FzOzoSxRxBCR+qYx3XT10WEloMpU1+q
         ToLykVOTTKN5OqAR0qOqyMTgH6WfA8R6Y6yBmvEzQYIkJUktN3U/IqhME/SRagxxgWxw
         TRsNfDpc1I4NisArX3jpAv4N9AO9d58nneUHXbt9kNbFyrgB2fPYTllP6K5oONNpR3l7
         ZU+e3FueC6+0ux47cVrcqvtCc46TZ71+9WB0GiK50JT8rXqlCrk+/LHCbGvBt6AwQOPv
         vZZA==
X-Forwarded-Encrypted: i=1; AKwUvBy0xcvOsC8T3M3Xli4hUYfH7hR8p9oGoy19w7q6fCO5YySBKvzPomCEaEIvrtM9PPNXhRlWFiwORI7CHjR+I/8=@lists.linux.dev
X-Gm-Message-State: AFuF++lAtUmWFnEpQSEGp+baQyKW5WXxJVmRE0s8PkYkJKEFvi5g4ol8
	/k/9oal1XShAy0iNp/UHc2kv616Nj2RC5xrxkmCSgS6zmAcfCWskM3Q0
X-Gm-Gg: AYBFou2WJ3R+tYgKVXT3z0WxFeMIlMaD7vJTOZ3M7GOTVaSXqCEMecCIhVRjOxdEaXq
	Jr72XzTBcOuGVwmYrU5sUP4uhGiDTixx0Z4TuOMBaOcMT+KEzF/QLBmXQoreMwjJuup60+pmL7Q
	7GYqyi2HQVGbi9JYnXwWxGtkHTU38gtMBZouCGs7AcDeFRb//4VFO9KhSX1hddfJJwe6x8oa+Gt
	4VlUlmm3ZOQf2Ay1AUMRQC7yE1N7UjZCHd8Yzjwo4zaHMwfxQdtS25mByFJLf9bsScuxIDgdy+k
	ArLoS9uxCCRYSu/Kyg8xugLfVcRio68b4PFohrv5Eb2lLElXUszlneytO8TvY91DBreXmwi7A6s
	agFDSm6PI7L/lMQzFs8WSFweNn/i6SDuKcE6hKBDoMA/VO6MIE8dvutXsKWaQk7gOLrD4J5sZBh
	+f093BRv38REMl7Us3hqBtSujL0ewcSwxoxPynTv0GXGc8bTrX2RMewii9n/gZ9TaAUg6pdPVTu
	atMVm2ZE65twsNTFGwCIR8Yiu+fNoJufWiFJZU=
X-Received: by 2002:a05:6a00:1743:b0:879:ffd9:1282 with SMTP id d2e1a72fcca58-87c819bc726mr913524b3a.8.1790074411386;
        Tue, 22 Sep 2026 03:53:31 -0700 (PDT)
Received: from localhost.localdomain ([2409:8a1e:2e81:7320:e5f5:eb9b:fe8e:9197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87cd584f183sm2302b3a.41.2026.09.22.03.53.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 03:53:30 -0700 (PDT)
From: Yuchao Zhang <ndaugoing@gmail.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	sashiko-reviews@lists.linux.dev,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuchao Zhang <ndaugoing@gmail.com>
Subject: Re: [PATCH] KVM: selftests: arm64: Add test for cross-vCPU LPI disable race
Date: Tue, 22 Sep 2026 18:53:22 +0800
Message-ID: <20260922105322.40484-1-ndaugoing@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260922102959.41FFA1F000FF@smtp.kernel.org>
References: <20260922102959.41FFA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks for the Sashiko review. All three points are legitimate; v2 addresses them:

1. INVALL/SYNC on unmapped collection:
Agreed - INVALL for collection 1 was a command error that stalls the
virtual ITS queue. v2 only sends INVALL and SYNC for TARGET_VCPU_ID
(the only mapped collection and the only vCPU receiving ITS commands);
unmapped collections and untouched vCPUs are skipped.

2. configure_lpis() overflow via -e:
Agreed. v2 bounds-checks the -e argument in main() (must fit in one 64K
ITT page) and adds an explicit assertion in configure_lpis() that
nr_lpis <= SZ_64K to guarantee the property table is never overrun.

3. Silently ignored KVM_SIGNAL_MSI failures:
Agreed in spirit. Injection failures are expected during the brief
window where the disable path has invalidated the ITS caches and the
guest has not yet remapped them. v2 counts successful injections
(checking KVM_SIGNAL_MSI return value > 0) and asserts at the end
that at least one succeeded, so a permanently broken environment can
no longer yield a false pass.

Additionally, v2 re-establishes the ITS mappings after every
EnableLPIs toggle. Without this, the disable path's cache invalidation
kills all mappings after the first iteration and the MSI flood goes
silent - now the overflow window exists on every iteration, matching
the re-initialisation sequence a real guest performs on re-enable.

Tested status is unchanged: no KVM-capable hardware available, so
compile- and TCG-plumbing-tested only; no Tested-by.

pw-bot: cr

Thanks,
Yuchao
