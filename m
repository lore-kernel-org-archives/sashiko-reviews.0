Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795204026;
	b=Gi4D7qfD8TUiEr0Uo4dkAtkn+bzqdFwHJ6mv3KNmUPB9LMfJXZFNGWbCBvd7ExFPRIdI
	 KKZETUE6Si+nK5fw02y/6lW3qd7oVi7+hj/fXwDqN6WYiDU5IjDC4nf7zL8Wb2NOSiRB1
	 xRfsZAidMaIntKhep8t5YwYlzevzzQHjhbXi7OxBaYpefiXxtEybM+9C66wCck2JiTNAq
	 H9HvLyyWrb4ozLKra1zYtHBs2OPhrd7A1nIlMkAgYFsLlPKF/Rjm5+hpXjuX6CjMoyy3W
	 h95gM31r3gMNUr8D4xRAOUMtLDIFKEecVMZNlS9EjULb6pz0dEpj9V0B5UcLHW4Z2Ow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version;
	bh=e3Qd9lqm2GC/AOlq/ZfGyfDObtCF7sAVb8g/8PBrXLg=;
	b=eQbklXpaW1NqUysInZzgjxr48SgBUgrKi7DR8gstDQenLzjNeTKJGMvcdF6Atpvkie25
	 OyoXZrhuM6lT49fE0lZ+zHaKFSxAzZtwXRC71ULo8YuFEBFmTej6DAxVG1AviBiWzHuT9
	 bq8i7hE0ZypWHIYg/x9GseYdQOLuBlB2thUntiQiwx2gqVYJVuyRs/UqLJ/jusNGl/gDi
	 fPsVxTBd8ATEdq616LYe2Bo50sqC92hca1w7Fznyr4XwHHj53MaNOa6QYeJWj/0ycgoUm
	 3sbL0A/nYt7Jd4VojzGcBIOG9zx4y1IAi+uoDweh3IfT7PfWjrGJGTlt/QwzbZCk7Tg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=KL3UKyQo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26B9606A6CB
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 19:47:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D26B9606A6CB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=KL3UKyQo
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKH7fEP2298964
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:47:05 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pps82601-s2048-2026-q3; bh=e3Qd9lqm2GC
	/AOlq/ZfGyfDObtCF7sAVb8g/8PBrXLg=; b=KL3UKyQoqii+kkrGYbCRZSD8MHP
	GtjcWco/7NUJeizS/IWfrU6Ai4xuki5tbigAvmjURYL3vI2iLh59Sx1Xl4OG7XTq
	UuAZc20U+ulo2cIofMX6kMJcU6wdEfPsasvr4Nz87v1PFyrIgxJEebAHfXeZeSu5
	h8uquqHSk6wecActWDiVHT9JiCLm4fUIVMCYzNHjpzi5MPWEY3Bvw0yarlzXqjx7
	3ztOKhrct85Vg2TdB8UawAP5k7kVtLeRRhBH0f3J3gI4S1wBv8GWv8JnsHOHHdhe
	hw9PC2oKCorK4l+4lCC5cYERk3Rhofleas0ha8XgIyr9O4OolKIefwc7BsA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4j2tb71a5w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:47:04 -0800 (PST)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b930598cf0so2226682b3a.1
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 11:47:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795204024; cv=none;
        d=google.com; s=arc-20260327;
        b=b2OZoC6szTgJFiiyi8jT0F0KT2EzFrTIuXy3lfwpZbIJ9Gv04zh99N4Epbk6Oi0dx5
         7jcF6w9m2e15pkCwZYAlS3ZtLZrlHlf0rQltmm9fMIoVJ7i69MOBdmFW3hp5JdMU/c3c
         mqqPEehQC92irXTLU1SzF9pLtf7mBcaoAX1MzFdUU2bvHQ60aEqCJTU6COJG6HAybpQE
         E7sMdga/rz9XD/Eor6YXYDKEl0qA8oVv7S7PGXFfcaUQnS4qT8VU8EA0LSlh3bWG2dR3
         v0ViAKjbt/YDz8cZ9VKucJhqlc3N1QuUStOBq+F+YjcTS9NwTTfus7CkcR4prR5FWr80
         NVzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=e3Qd9lqm2GC/AOlq/ZfGyfDObtCF7sAVb8g/8PBrXLg=;
        fh=Je+XfjZZELYMeUFG782y9M4oZFPTVtwBgMoamcbwTg0=;
        b=bgc18wNt1r5wQ2+mbnkY6zo/uVUAk1l8YBna5gmT5T9gq4EIVpeqc6qEo+Hg7chymF
         l1WY3MjDVR5LjjWW1ZfWhCK9On7jPdKWmgZ2ixLgy1+4IHxAy0eQmHk/Lah8VzQfJ+Kd
         4msSuWt7aCyL8aVEPr1srH4uAbO8Z27W7iaELlOMnki8YVCrrQPofaI9SqHarqxgLI8C
         Tr8mlpOyDrZ5odsri7ckMw7s0pKQ6rknc/uAzoqfQyKpABQV3W/2BU7eDcTL3PIjclnb
         4P/5GUYqgeKl8YlNTx1ZAbFmL0NqG1fCIkBzL1AOaWCGBW1Erw8EDLU49sgPsMagZOxo
         tg5w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204024; x=1795808824;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e3Qd9lqm2GC/AOlq/ZfGyfDObtCF7sAVb8g/8PBrXLg=;
        b=jePWC5JBugp37+b0X3UieOs12rhjlw9Kn8xIv0+YgjAKy4fHzdOEnizA/LqBBMAoyG
         YmubGzY4eA1kaIcaJS/5E+wc5TDRSzsSDeaqAubsrXUmNjZjcNb0Y91cp6osuRqaIkwo
         UjRSUQtQ0y5zukHmjdn/l/49acQPuoFb/ASYu2wYVp/D1ER8diGEtLWmXRJveqszsnVG
         YR+eoFQ9IcG+VVZe0Y/x9kwm+B4IPsUzNl0HCf+GINotfRidUm7t4B6gVu1dkv6XaE+H
         4DxygABeYOqlHjJr/n149aosIViBSHc0dZJ4gUiXlG58m1s1xPgusqpruCumxR7duET5
         4Yfg==
X-Gm-Message-State: APuU4Z+GMWb8fVIEMnA4298iMfR3RK6iarsm01oJTXJlnzO6RH2v9fr3
	oIF9BqJMZWoLXkfzWhI850OUhnHvYIIdrBeqoIFqK3DAzdxmcS9NIOYm1pDeHOWCyPO3EYJawx7
	v4e9lFYuLhSPgWKpSj9O0kQV3Lqjj8ROCEdFIbuC6DP8JgnXCsNVyDet6k6xiXlDh4XpooeFhhH
	1ToOPbNl6JqavoMcfzih2ZD1FH1rX6MtTKcpHkfeuVRsQ72F7J7UHwhw==
X-Gm-Gg: AYBFou0IFRn3aTbKvwPnzGYUlcmn3QVoOToijJCxZgi9wXoR3T6lvLTzGae/thvDe7f
	XofFfP3umz0oIwe+esT28/iWuQont8/SW9aUuWKuko6rA85CtK8Drqp1bt1EpKyMcCEGiD2HNO2
	w22Z7GQVcWRO0qI7VFuN/+nEmE//aNND0IuPWJHZxLzwQMXQ+b48IrcOAMmGsadpQDXNN8uq6GP
	QK7xoC7jaYG2DAM9iItucogvA9kNTA8
X-Received: by 2002:a05:6a21:4d14:b0:3e1:d75e:651e with SMTP id adf61e73a8af0-4014b65da72mr4526402637.16.1795204024101;
        Fri, 20 Nov 2026 11:47:04 -0800 (PST)
X-Received: by 2002:a05:6a21:4d14:b0:3e1:d75e:651e with SMTP id
 adf61e73a8af0-4014b65da72mr4526384637.16.1795204023576; Fri, 20 Nov 2026
 11:47:03 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119013103.1092559-1-toddfreed@meta.com> <20261119013103.1092559-3-toddfreed@meta.com>
 <sashiko-outbox-224309@kernel.org>
In-Reply-To: <sashiko-outbox-224309@kernel.org>
From: Todd Bert Freed <toddfreed@meta.com>
Date: Fri, 20 Nov 2026 11:46:51 -0800
X-Gm-Features: AclHuK8FGaO9Aw2ev57MNRSL6FQOQNTk1bJDiyMnIg82e246BtElLrxY20MX0KI
Message-ID: <CADh2yMxTi1zr5UT2sEYCnRTk5PJ+Uvtqujfg9AhZp8c5mo8G1Q@mail.gmail.com>
Subject: Re: [PATCH net-next v2 02/12] psp: take the psp nexthdr from the
 packet on encap
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3OCBTYWx0ZWRfX+hRRI/zM6ZDW
 J6IaRvOZ1HfblPautzgas6MGJk/yv0DmkBBvQvsSfPsJQc5H+/5wj4hBCwA8DWQrK/LNRSjscH9
 ssLrHSoO4HIqyM0Wlh0qQX80Wmqfoao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3OCBTYWx0ZWRfXwBlOMtjGH8aZ
 gymvhETKDcs27rtPVPcM7IwSa8GjJKbKsnpQHBL0b9DN5PrJq0qqw52+UYikmFdJfUuh/q081jk
 9NiIjzAmSWRAgONokcgolYPcAprUbn8dLrUyVMQNiVq1BvaMH4/gKhKy0Z+lpFyFY49phs8WbII
 dTINrWam50WjuoQhKRQFqz7mO6bXq6eDJUIXm9TCMhmJbMoh8PY97UXkiGj7K7YM0jUTRqGl2SG
 Ki1YKP2DPobj78uTsoVMTIhPFD1nPxmSJXFDGtt2755jYdlu23ml1Hjv2Y4XU2g2e7lm1YUkIK5
 9pu9/7AXZY/zjmueGEsZdbPCTs1Y7/IW9nJDHqKn8uJzmnmNaCESniSh9QWcKadHyJpkDH/jYES
 QIQiZVQOantpPgtFLjj95YbOCP5kA8wedd3TENaQcNMJOGpCkFtKx99fqCo5lovcypAer/36YSQ
 wE7ACFoT/SP+5Qpgq1w==
X-Proofpoint-ORIG-GUID: yRJys6niuHhmgIx-Ba-hfXJ6d6VwtBD-
X-Authority-Analysis: v=2.4 cv=A/v5rKWG c=1 sm=1 tr=0 ts=6b00a3b8 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22 a=03ozwUkBphtHgyqjj1sw:22
 a=575YS4XHc6AQ9hrrRVEA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: yRJys6niuHhmgIx-Ba-hfXJ6d6VwtBD-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01

> [Severity: Medium]
> Can clearing NETIF_F_CSUM_MASK or NETIF_F_GSO_MASK on a tunneled GSO skb
> (skb->encapsulation == 1) cause software GSO to strip skb->encapsulation
> before psp_dev_encap_ok() checks it?
>
> ...
>
> When those segments reach mlx5e_psp_handle_tx_skb() ->
> psp_dev_encapsulate(), psp_dev_encap_ok() sees seg->encapsulation == 0
> and skb_network_header_len(seg) == ip_hdrlen(seg), so it encapsulates
> the tunnel packet with nexthdr = IPPROTO_GRE instead of rejecting it.
> mlx5e_psp_set_swp() then leaves eseg->swp_inner_l4_offset as 0 because
> skb->inner_ipproto is IPPROTO_GRE, while
> mlx5e_psp_txwqe_build_eseg_csum() still sets
> MLX5_ETH_WQE_L4_INNER_CSUM for the CHECKSUM_PARTIAL segment, producing
> corrupted frames or device TX syndromes.

I reproduced this on ConnectX-7 with a GRE netdev (with csum) dev-assoc'd to
the PSP device, a TCP socket routed over the GRE netdev, and rx-assoc and
tx-assoc to activate PSP on the socket.

It does not produce corrupted frames, but the GRE checksum is left unfilled,
which would be an Rx drop if this path were otherwise working.

It's not otherwise working though. In upstream, psp_write_headers() writes
psph->nexthdr = IPPROTO_TCP, so the GRE payload is misidentified as TCP. And
with the net fix "psp: don't encapsulate ipv6 packets with extension headers",
only packets whose L4 protocol is TCP are sent.

This patch relaxes that check to permit other next headers, but adds other
exclusions: fragments, and skbs whose inner headers are already set up for
offload (skb->encapsulation). The latter drops the non-GSO packets of this
flow; software GSO clears it on the segments, which is how they got through.

Anyway, this demonstrates another exclusion is needed, and I will add a check
like this in v3:

          /* Devices complete only a TCP or UDP checksum behind the PSP header.
           * Software GSO of a tunnel with an outer checksum, e.g. GRE, leaves
           * the segments here with encapsulation cleared and CHECKSUM_PARTIAL
           * at the tunnel header.
           */
          if (skb->ip_summed == CHECKSUM_PARTIAL &&
              nexthdr != IPPROTO_TCP && nexthdr != IPPROTO_UDP)
                  return false;

-Todd
