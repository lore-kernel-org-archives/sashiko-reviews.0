Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E9237B3FE
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 08:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789115884; cv=none; b=C4QW3A3zRN2jWCaI+RdCFWCBiADyhGgqGWidVufowqCaejITVtaVf9yyZwuQ1BVsNKMff4sKz79zyv69+vC3kGGmR7sDBJ+ET245mQ5nR/bwg8aE07gLlVsBhwlRA3URXHmKtnCsEqoa3xXuJPvZCkG31MGkm39wF65Hc4cGiKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789115884; c=relaxed/simple;
	bh=V8gbEazb6tXFaEzTBxWKVf4YbJOr4fwO/mW+6t9MkSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F5Izm37N4xwfoaN+ug4TeUvwErDM8FQlUxVYlLElHpGsdmas9Qc3z7MO7A4Ga1K7jhVsDCfwidmJCT+5Xsq6Z7oMCmHlrawyZZcNqMXP5x8sC0W8x8AvuQTyhD+VS6eGrL8VEbfY5maJrH9CPGWnBov0AijtnagS3S8RP2XrsL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=r2b2jc+f; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="r2b2jc+f"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B81iZc1253529
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 08:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=sozkM+f+xSRL1Pi/gT4ex4aHcAMoHAh3vWphV/6pu
	/U=; b=r2b2jc+frE3IAycSiZrBX5le0f9OE8cz6OESSnnd4a9FIbIbcyHwDUlL1
	6Lqdtka0bCZnkzlflZ6hENdnEPHPC7XAfCXWBFAV3wFkTHY6gqeS3f/HqKjEp1kz
	6z2H9a3pOzyAlnztk9xTrLJXij/MDhIGxvd/sBdMF0D27s9XpJdS521qt/pLyzGH
	ladGDtVPxCkXxLkq0NXOEXyTwkJkX9pT9Us8QEvWFzfviohdzmi1kRPXljLm9+5m
	1tgnqea6JVQC6UgUg2HwN4LEVY6vMmuGfCoclUQs4NYnQyDVAZGFBydR+FRhNAcG
	JcfYFstZjKFtbvTjwy9i4DrjSeNzw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4gkd8t28ye-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 08:38:01 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7o4iM1317952
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 08:38:00 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4gkvtfda3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <sashiko-reviews@lists.linux.dev>; Fri, 11 Sep 2026 08:38:00 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 68B8bu5q47055242
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Sep 2026 08:37:56 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B50F2004B;
	Fri, 11 Sep 2026 08:37:56 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6838220040;
	Fri, 11 Sep 2026 08:37:56 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.87.85.9])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 11 Sep 2026 08:37:56 +0000 (GMT)
From: M Nikhil <nikh1092@linux.ibm.com>
To: sashiko-reviews@lists.linux.dev
Cc: M Nikhil <nikh1092@linux.ibm.com>
Subject: [PATCH v12 0/2] zfcp: Use DMA streaming API to map I/O
Date: Fri, 11 Sep 2026 10:37:50 +0200
Message-ID: <20260911083752.1316976-1-nikh1092@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExOSBTYWx0ZWRfX/K9oWzPvxoi1
 z6i8kKsq9nIm2rZkG7CVqKMgvE7YQbJrnztsRlznLPh+z5WuT5AmJSOjPrYMqlVdy81qyVp725J
 a75yhCx9scQZvr35z+QFoM54T+OD2BA=
X-Proofpoint-ORIG-GUID: rsvmedXeiRpfi_Z9Uq4se37-428ppt3M
X-Proofpoint-GUID: rsvmedXeiRpfi_Z9Uq4se37-428ppt3M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExOSBTYWx0ZWRfXxWe8lZGTDf4i
 OrtxdyMxX5ztXi5Azhsp6N8DM7Saqh3ZGU4H53s5enXKtF7haHEygPXnZ8032jZimLAPQUPIRsC
 QvCTgc+/asuAsmCTRp16Wd5/izmD9NYlWS+K59RlOoSxm6i0IlizYiTpuj/2PfrE4gRBls75oDr
 dd1f2WvSoUcGFT/lYegmFuSeYhm0LEIhZ+JnWY1reKKQoRBR7wwQl7DmQWodOkc9EHA1Q4AvIto
 lL0/nU0WsApA+hmyyjQJyqplRA3D9gBIZVek9C4IQBYeEpcxH/+iim01zUpld2A+VRE1tL9ya+B
 FFHfk6s4mIYF4FBFrR0SDDIGnEilUXQzmwBDa35+c77h1+5TcEvH9xNaGJBij2aGQayStJbz4Np
 VCL1H+benFK3GaMUXqkSOKA/zjn0Eemw39FW3KSIhyz+gtEa/6iMmquOLMaTxwD74++wy1N996a
 PTKURHoPetng0RXT5yw==
X-Authority-Analysis: v=2.4 cv=PIGaavqC c=1 sm=1 tr=0 ts=6aa3bde9 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=RzCfie-kr_QcCd8fBx8p:22 a=VnNF1IyMAAAA:8 a=Wd4ccqAm3J3WqkYLFQkA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110119

In the existing zFCP driver, virtual addresses are translated directly
into bus (physical addresses) for DMA operations on all I/O buffers
passing from zFCP driver to the device.

Need for using DMA-API in zFCP driver:

In a Secure Execution environment, the host must ensure that device DMA
accesses are restricted to non-guest-private, page-sized memory blocks.
This prevents I/O failures that can occur when a device attempts to
access guest-private memory. Therefore, guest memory pages must be
prepared by the hypervisor before they become accessible to an I/O
device.

To support this requirement, the host Linux kernel must be reliably
informed whenever a memory region becomes eligible for device DMA access
and when that access must be revoked. This information must be
maintained correctly at least at page size granularity. To satisfy these
requirements, all I/O buffers used by the zFCP driver should be mapped
through the DMA API.

DMA API Integration in zFCP:

The zFCP driver is updated to use the DMA streaming API's to map all the
I/O buffers which will be passed to the device.
All zFCP I/O buffers (QTCB, SRB, CT/ELS and SCSI I/O) are represented as
scatter-gather lists and mapped through DMA API using dma_map_sgtable().
Once the DMA transfer is complete, the corresponding mappings are
released using dma_unmap_sgtable().

By routing all device-visible memory through the DMA mapping layer, the
driver ensures that:
1. DMA access is properly authorized before use.
2. DMA is revoked after use.
3. Secure Execution memory restrictions are honored.

Changes on the github can be found at:
https://github.ibm.com/M-Nikhil/linux/commits/zfcp_dma_api_implementation_io_path_version12

M Nikhil (2):
  zfcp: Replace sg-list with sg_table in zfcp_fsf_ct_els structure
  zfcp: Use DMA streaming API to map I/O

 drivers/s390/scsi/zfcp_aux.c  |  16 +++
 drivers/s390/scsi/zfcp_dbf.c  |  16 +--
 drivers/s390/scsi/zfcp_def.h  |   4 +
 drivers/s390/scsi/zfcp_ext.h  |  10 +-
 drivers/s390/scsi/zfcp_fc.c   |  36 +++--
 drivers/s390/scsi/zfcp_fsf.c  | 260 ++++++++++++++++++++++++++++------
 drivers/s390/scsi/zfcp_fsf.h  |   9 +-
 drivers/s390/scsi/zfcp_qdio.c |  37 +++--
 drivers/s390/scsi/zfcp_qdio.h |  27 ++--
 9 files changed, 321 insertions(+), 94 deletions(-)

-- 
2.53.0

